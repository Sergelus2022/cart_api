class CartsController < ApplicationController
  TOKEN = "secret!"
  before_action :authenticate #,except: :show
  #validates :comment, length: { minimum: 3}  #validates :comment, presence: true

  def index
    @carts = Cart.all
    render :json => @carts
  end

  def create
    @ncart = Cart.new
    @ncart.comment = params[:comment]
    if params[:api_key]
     @ncart.api_key = params[:api_key]
     @ncart.api_key = SecureRandom.base58(24)
    else
      render json: "error", status: :error
    end   
    if @ncart.save!
      render json: @ncart , status: :ok
    else  
      render json: "error", status: :error
    end
    puts "test"
  end


  def show
    @cart = Cart.find_by_api_key(params[:api_key])
    if !@cart
      render json: "Item not found", status: :not_found
    else 
      #@cart.login_count ++
      render json: @cart , status: :ok
    end
  end

  def new
    puts "new"
  end

  def destroy
    @cart = Cart.find_by_api_key(params[:api_key])
    if !@cart
      render json: "Item not found", status: :not_found
    else @cart.destroy
      render json: "Cart was deleted with success" , status: :ok
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      # Compare the tokens in a time-constant manner, to mitigate
      # timing attacks.
      ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
    end
  end
  
end