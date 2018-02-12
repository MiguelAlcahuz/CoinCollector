require 'rails_helper'

RSpec.describe ToggleCoinController, type: :controller do
	

	let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  
  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested collection" do
        collection = Collection.create! valid_attributes
        put :update, params: {id: collection.to_param, collection: new_attributes}, session: valid_session
        collection.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the collection" do
        collection = Collection.create! valid_attributes
        put :update, params: {id: collection.to_param, collection: valid_attributes}, session: valid_session
        expect(response).to redirect_to(collection)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        collection = Collection.create! valid_attributes
        put :update, params: {id: collection.to_param, collection: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the toggled coin from the collection" do
      collection = Collection.create! valid_attributes
      expect {
        delete :destroy, params: {id: collection.to_param}, session: valid_session
      }.to change(collection, :count).by(-1)
    end

    it "redirects to the coin collection index" do
      collection = Collection.create! valid_attributes
      delete :destroy, params: {id: collection.to_param}, session: valid_session
      expect(response).to redirect_to(collection_coins_url)
    end
  end
end
