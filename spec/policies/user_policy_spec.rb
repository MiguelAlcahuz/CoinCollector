require 'rails_helper'

RSpec.describe UserPolicy type: :policy do

  let(:collectionist) {User.new(id: 1, email: 'mikelacahuz@gmail.com', username: 'el collecionista', roles: 'collectionist')}
  let(:admin) {User.new(id: 2, email: 'miguelalcahuz@gmail.com', username: 'iamthebosshere', roles: 'admin')}
  
  context "an admin can see everything from other users" do
    subject { UserPolicy }
    permissions :show?, :new?, :create?, :index?, :update?, :edit?, :destroy? do
      it { expect(subject).to permit(admin) }
      it { expect(subject).not_to permit(collectionist) }
    end
  end
end


