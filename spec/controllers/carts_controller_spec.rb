describe CartsController, type: :controller do
    let(:valid_attributes) { { comment: 'Comment', api_key: 'valid_key' } }
    let(:invalid_attributes) { { comment: '', api_key: '' } }

    describe "GET #index" do
        it "returns a success response" do
            Cart.create! valid_attributes
            get :index, params: {}
            expect(response).to be_successful
        end
    end
end    