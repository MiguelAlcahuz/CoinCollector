require 'rails_helper'


RSpec.describe CollectionsController, type: :controller do

  let(:valid_attributes) {
    {currency:"euros5", user_id:1}
  }

  let(:invalid_attributes) {
    {currency: nil, user_id: nil}
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
        collection = Collection.create! valid_attributes
        get :index, params: {id: collection.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #show" do
        collection = Collection.create! valid_attributes
        get :show, params: {id: collection.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #new" do
        get :new, params: {collection: valid_attributes}
        expect(response).to be_success
      end

      it "returns a success response when GET #edit" do
        collection = Collection.create! valid_attributes
        get :edit, params: {id: collection.to_param}
        expect(response).to be_success
      end

      context "with valid params when POST #create" do
        it "creates a new collection" do
          expect {
            post :create, params: {collection: valid_attributes}
          }.to change(Collection, :count).by(1)
        end

        it "redirects to the index of your collections" do
          post :create, params: {collection: valid_attributes}
          expect(response).to redirect_to(collections_url)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {collection: invalid_attributes}
          expect(response).to be_success
        end
      end

      context "with valid params when PUT #update" do
        let(:new_attributes) {
          {currency: "euros1", user_id: 1}
        }

        it "updates the requested collection" do
          collection = Collection.create! valid_attributes
          put :update, params: {id: collection.to_param, collection: new_attributes}
          collection.reload
        end

        it "redirects to the index coin of the collection" do
          collection = Collection.create! valid_attributes
          put :update, params: {id: collection.to_param, collection: valid_attributes}
          expect(response).to redirect_to(collection_coins_path(collection.to_param))
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          collection = Collection.create! valid_attributes
          put :update, params: {id: collection.to_param, collection: invalid_attributes}
          expect(response).to be_success
        end
      end

      it "destroys the requested collection when DELETE #destroy" do
        collection = Collection.create! valid_attributes
        expect {
          delete :destroy, params: {id: collection.to_param}
        }.to change(Collection, :count).by(-1)
      end

      it "redirects to the collections list" do
        collection = Collection.create! valid_attributes
        delete :destroy, params: {id: collection.to_param}
        expect(response).to redirect_to(collections_url)
      end
    end

    context " when the user is a collectionist" do
      login_user

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end

      it "returns a success response when GET #index" do
        collection = Collection.create! valid_attributes
        get :index, params: {id: collection.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #show" do
        collection = Collection.create! valid_attributes
        get :show, params: {id: collection.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #new" do
        get :new, params: {collection: euros}
        expect(response).to be_success
      end

      it "returns a success response when GET #edit" do
        collection = Collection.create! valid_attributes
        get :edit, params: {id: collection.to_param}
        expect(response).to be_success
      end

      context "with valid params when POST #create" do
        it "creates a new collection" do
          expect {
            post :create, params: {collection: valid_attributes}
          }.to change(Collection, :count).by(1)
        end

        it "redirects to the index of your collections" do
          post :create, params: {collection: valid_attributes}
          expect(response).to redirect_to(collections_url)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: {collection: invalid_attributes}
          expect(response).to be_success
        end
      end

      context "with valid params when PUT #update" do
        let(:new_attributes) {
          {currency: "euros1", user_id: 1}
        }

        it "updates the requested collection" do
          collection = Collection.create! valid_attributes
          put :update, params: {id: collection.to_param, collection: new_attributes}
          collection.reload
        end

        it "redirects to the index collection" do
          collection = Collection.create! valid_attributes
          put :update, params: {id: collection.to_param, collection: valid_attributes}
          expect(response).to redirect_to(collection_coins_path(collection.to_param))
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          collection = Collection.create! valid_attributes
          put :update, params: {id: collection.to_param, collection: invalid_attributes}
          expect(response).to be_success
        end
      end

      it "destroys the requested collection when DELETE #destroy" do
        collection = Collection.create! valid_attributes
        expect {
          delete :destroy, params: {id: collection.to_param}
        }.to change(Collection, :count).by(-1)
      end

      it "redirects to the collections list" do
        collection = Collection.create! valid_attributes
        delete :destroy, params: {id: collection.to_param}
        expect(response).to redirect_to(collections_url)
      end
    end
  end
end