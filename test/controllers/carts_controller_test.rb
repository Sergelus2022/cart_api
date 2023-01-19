require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:valid_attributes) { { comment: "valid comment", api_key: "valid_api_key" } }
  let(:invalid_attributes) { { comment: nil, api_key: nil } }

  describe "GET #index" do
    it "returns a success response" do
      Cart.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Cart" do
        expect {
          post :create, params: { cart: valid_attributes }
        }.to change(Cart, :count).by(1)
      end

      it "renders a JSON response with the new cart" do
        post :create, params: { cart: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(cart_url(Cart.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new cart" do
        post :create, params: { cart: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      cart = Cart.create! valid_attributes
      get :show, params: { api_key: cart.api_key }
      expect(response).to be_successful
    end

    it "renders a JSON response with 'Item not found' for a non-existent cart" do
      get :show, params: { api_key: "non_existent_api_key" }
      expect(response).to have_http_status(:not_found)
      expect(response.content_type).to eq('application/json')
      expect(response.body).to eq("Item not found")
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested cart" do
      cart = Cart.create! valid_attributes
      expect {
        delete :destroy, params: { api_key: cart.api_key }
      }.to change(Cart, :count).by(-1)
    end

    it "renders a JSON response with 'Cart was deleted with success'" do
      cart = Cart.create! valid_attributes
      delete :destroy, params: { api_key: cart.api_key }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json')
      expect(response.body).to eq("Cart was deleted with success")
    end

    it "renders a JSON response with 'Item not found' for a non-existent cart" do
      delete :destroy

