class CartsController < ApplicationController
  TOKEN = "secret!"
  before_action :authenticate #,except: :show


  def index
    @carts = Cart.all
    render :json => @carts
  end

  def create
    @ncart = Cart.new
    @ncart.comment = params[:comment]
    if params[:api_key]
     @ncart.api_key = params[:api_key]
     @ncart.api_key = SecureRandom.base58(48)
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
      cart_json = @cart.as_json(only: [:id, :total_price], include: {sellitems: {only: [:id, :product, :quantity, :price]}})
      render json: cart_json , status: :ok
    end
  end

  def add
    @cart = Cart.find_by_api_key(params[:api_key])
    slitem = @cart.sellitems.new
    slitem.quantity = params[:quantity]
    slitem.product = params[:product]
    slitem.save

    if !slitem.save
      render json: "Item not found", status: :not_found
    else 
      cart_json = @cart.as_json(only: [:id, :total_price], include: {sellitems: {only: [:id, :product, :quantity, :price]}})
      render json: cart_json , status: :ok
    end
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

  def drop
    @cart = Cart.find_by_api_key(params[:api_key])
    if !@cart
      render json: "Cart not found", status: :not_found
    else 
      @cart.sellitems.destroy_all
      render json: "All items from cart deleted!" , status: :ok
    end
  end
  def drop_item
    @cart = Cart.find_by_api_key(params[:api_key])
    if !@cart
      render json: "Cart not found", status: :not_found
    else 
      @cart.sellitems.
      render json: "All items from cart deleted!" , status: :ok
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
