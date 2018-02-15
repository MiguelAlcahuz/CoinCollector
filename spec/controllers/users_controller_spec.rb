require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) {
    {email: 'mikelacahuz@gmail.com', username: 'el collecionista',password: "12341234", roles: 'admin'}
  }

  let(:invalid_attributes) {
    {email: 'mikelacahuz@gmail.com', username: 'el collecionista',password: "12341234", roles: 'collectionist'}
  }

  describe "check the following actions" do
    context "when user is admin" do
      login_admin

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end

      it "returns a success response when GET #index" do
        user = User.create! valid_attributes
        get :index, params: {id: user.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #show" do
        user = User.create! valid_attributes
        get :show, params: {id: user.to_param}
        expect(response).to be_success
      end

      it "returns a success response when GET #new" do
        get :new, params: {user: valid_attributes}
        expect(response).to be_success
      end

      it "returns a success response when GET #edit" do
        user = User.create! valid_attributes
        get :edit, params: {id: user.to_param}
        expect(response).to be_success
      end

      context "with valid params" do
        let(:new_attributes) {
          {email: 'mikelacahuz@gmail.com', username: 'HKD',password: "12341234", roles: 'admin'}
        }

        it "updates the requested user" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: new_attributes}
          user.reload
        end

        it "redirects to the user" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: valid_attributes}
          expect(response).to redirect_to(user)
        end
      end

      context "with invalid params" do
        it "returns a success response (i.e. to display the 'edit' template)" do
          user = User.create! valid_attributes
          put :update, params: {id: user.to_param, user: invalid_attributes}
          expect(response).not_to be_success
        end
      end

      it "destroys the requested user" do
        user = User.create! valid_attributes
        expect {
          delete :destroy, params: {id: user.to_param}
        }.to change(User, :count).by(-1)
      end

      it "redirects to the users list" do
        user = User.create! valid_attributes
        delete :destroy, params: {id: user.to_param}
        expect(response).to redirect_to(users_url)
      end
    end
  end
end