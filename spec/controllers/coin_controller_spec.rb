require 'rails_helper'


RSpec.describe CoinsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      coin = Coin.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      coin = Coin.create! valid_attributes
      get :show, params: {id: coin.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {coin: valid_attributes}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      coin = Coin.create! valid_attributes
      get :edit, params: {id: coin.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new coin" do
        expect {
          post :create, params: {coin: valid_attributes}, session: valid_session
        }.to change(Coin, :count).by(1)
      end

      it "redirects to the created coin" do
        post :create, params: {coin: valid_attributes}, session: valid_session
        expect(response).to redirect_to(coin.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {coin: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested coin" do
        coin = Coin.create! valid_attributes
        put :update, params: {id: coin.to_param, coin: new_attributes}, session: valid_session
        coin.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the coin" do
        coin = Coin.create! valid_attributes
        put :update, params: {id: coin.to_param, coin: valid_attributes}, session: valid_session
        expect(response).to redirect_to(coin)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        coin = Coin.create! valid_attributes
        put :update, params: {id: coin.to_param, coin: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested coin" do
      coin = Coin.create! valid_attributes
      expect {
        delete :destroy, params: {id: coin.to_param}, session: valid_session
      }.to change(coin, :count).by(-1)
    end

    it "redirects to the coins list" do
      coin = Coin.create! valid_attributes
      delete :destroy, params: {id: coin.to_param}, session: valid_session
      expect(response).to redirect_to(coins_url)
    end
  end
end