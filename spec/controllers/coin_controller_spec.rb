require 'rails_helper'


RSpec.describe CoinsController, type: :controller do

  let(:valid_attributes) {
    {year: 2017, country: "andorra", value: "onecent"}
  }

  let(:invalid_attributes) {
    {year: nil, country: nil, value: nil}
  }

  let(:collectionist) {User.create(email: 'mikelacahuz@gmail.com', username: 'el collecionista',password: "12341234", roles: 'collectionist')}
  let(:euros) {Collection.create(currency: 'euros', user_id: collectionist.id)}
  
  describe "check the following actions" do
    context "when user is admin" do
      login_admin

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end

      it "returns a success response when GET #index" do
      get :index, params: {collection_id: euros.to_param}
      expect(response).to be_success
      end

      it "returns a success response when GET #show" do
        coin = Coin.create! valid_attributes
        get :show, params: {collection_id: euros.to_param, id: coin.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #new" do
        get :new, params: {collection_id: euros.to_param, coin: valid_attributes}
        expect(response).to be_success
      end

      it "returns a success response when GET #edit" do
        coin = Coin.create! valid_attributes
        get :edit, params: {collection_id: euros.to_param, id: coin.to_param}
        expect(response).to be_success
      end

      context "with valid params POST #create" do

        it "creates a new coin" do
          expect {
            post :create, params: {collection_id: euros.to_param, coin: valid_attributes}
          }.to change(Coin, :count).by(1)
        end

        it "redirects to the index coin" do
          post :create, params: {collection_id: euros.to_param, coin: valid_attributes}
          expect(response).to redirect_to(collection_coins_url)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {collection_id: euros.to_param, coin: invalid_attributes}
          expect(response).not_to be_success
        end
      end

      context "with valid params PUT #update" do
        let(:new_attributes) {
          {year: 2018, country: "andorra", value: "onecent"}
        }

        it "updates the requested coin" do
          coin = Coin.create! valid_attributes
          put :update, params: {collection_id: euros.to_param, id: coin.to_param, coin: new_attributes}
          coin.reload
        end

        it "redirects to the coin index" do
          coin = Coin.create! valid_attributes
          put :update, params: {collection_id: euros.to_param, id: coin.to_param, coin: valid_attributes}
          expect(response).to redirect_to(collection_coins_url)
        end
      end

      context "with invalid params PUT #update" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          coin = Coin.create! valid_attributes
          put :update, params: {collection_id: euros.to_param, id: coin.to_param, coin: invalid_attributes}
          expect(response).to be_success
        end
      end

      it "destroys the requested coin" do
      coin = Coin.create! valid_attributes
      expect {
        delete :destroy, params: {collection_id: euros.to_param, id: coin.to_param}
      }.to change(Coin, :count).by(-1)
    end

      it "redirects to the coins list when destroyed" do
        coin = Coin.create! valid_attributes
        delete :destroy, params: {collection_id: euros.to_param,id: coin.to_param}
        expect(response).to redirect_to(collection_coins_url)
      end
    end
  end

 describe "check the following actions" do
    context "when user is a collectionist" do
      login_user

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end

      it "returns a success response when GET #index" do
      get :index, params: {collection_id: euros.to_param}
      expect(response).to be_success
      end

      it "returns a success response when GET #show" do
        coin = Coin.create! valid_attributes
        get :show, params: {collection_id: euros.to_param, id: coin.to_param}
        expect(response).to be_success
      end
    end
  end
end