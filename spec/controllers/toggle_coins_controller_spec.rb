require 'rails_helper'

RSpec.describe Collection::ToggleCoinsController, type: :controller do
	
  let(:collectionist) {User.create(email: 'mikelacahuz@gmail.com', username: 'el collecionista',password: "12341234", roles: 'admin')}
  let(:euros) {Collection.create(currency: 'euros6', user_id: collectionist.id)}

  let(:coin){Coin.create(country: "andorra", value: 0.01, year: 2015)}
  
  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested collection with the toggled coin" do
        collection = euros
        collection.coins.include?(coin)
        expect {
          put :update, params: {id: collection.to_param, toggle_coin_id: coin.to_param}
        }.to change(collection.coins, :count).by(1)
      end

      it "redirects to the coin collection index" do
        collection = euros
        put :update, params: {id: collection.to_param, toggle_coin_id: coin.to_param}
        expect(response).to redirect_to(collection_coins_path(collection))
      end
    end

    context 'when the collection already contains the given coin' do
      before do
        @collection = euros
        @collection.coins.include?(coin)
      end
      it "does not destroy the toggled coin from the collection" do
        expect {
          delete :destroy, params: {id: @collection.to_param, toggle_coin_id: coin.to_param}
        }.to change(@collection.coins, :count).by(0)
      end

      it "redirects to the coin collection index" do
        delete :destroy, params: {id: @collection.to_param, toggle_coin_id: coin.to_param}
        expect(response).to redirect_to(collection_coins_path(@collection))
      end
    end
  end

  describe "DELETE #destroy" do
    context 'when the collection contains the given coin' do
      before do
        @collection = euros
        @collection.coins << coin
      end
      it "destroys the toggled coin from the collection" do
        expect {
          delete :destroy, params: {id: @collection.to_param, toggle_coin_id: coin.to_param}
        }.to change(@collection.coins, :count).by(-1)
      end

      it "redirects to the coin collection index" do
        delete :destroy, params: {id: @collection.to_param, toggle_coin_id: coin.to_param}
        expect(response).to redirect_to(collection_coins_path(@collection))
      end
    end

    context 'when the collection does not contain the given coin' do
      before do
        @collection = euros
      end
      it "does not destroy the toggled coin from the collection" do
        expect {
          delete :destroy, params: {id: @collection.to_param, toggle_coin_id: coin.to_param}
        }.to change(@collection.coins, :count).by(0)
      end

      it "redirects to the coin collection index" do
        delete :destroy, params: {id: @collection.to_param, toggle_coin_id: coin.to_param}
        expect(response).to redirect_to(collection_coins_path(@collection))
      end
    end
  end
end
