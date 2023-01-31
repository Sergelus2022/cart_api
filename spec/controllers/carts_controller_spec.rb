require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      Cart.create!(comment: "Test comment")
      get :index, params: {}
      expect(response).to be_successful
      expect(JSON.parse(response.body).first["comment"]).to eq("Test comment")
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Cart" do
        expect {
          post :create, params: { comment: "Test comment", api_key: "12345678" }
        }.to change(Cart, :count).by(1)
        expect(response).to be_successful
        expect(JSON.parse(response.body)["comment"]).to eq("Test comment")
      end
    end

    context "with missing api_key" do
      it "returns an error response" do
        post :create, params: { comment: "Test comment" }
        expect(response).to have_http_status(:error)
        expect(JSON.parse(response.body)).to eq("error")
      end
    end
  end
end
 