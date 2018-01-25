require 'rails_helper'

RSpec.describe CollectionPolicy do

  let(:collectionist) {User.new(id: 1, email: 'mikelacahuz@gmail.com', username: 'el collecionista', roles: 'collectionist')}
  let(:admin) {User.new(id: 2, email: 'miguelalcahuz@gmail.com', username: 'iamthebosshere', roles: 'admin')}
  let(:euros) {Collection.new(currency: 'euros', user_id: 1)}
  let(:dollars) {Collection.new(currency: 'dollars', user_id: 2)}

  context "for an admin and collectionist over their own collection, and admin over another" do
    subject { CollectionPolicy }
    permissions :show?, :new?, :create?, :index?, :update?, :edit?, :destroy? do
      it { expect(subject).to permit(admin, euros) }
      it { expect(subject).to permit(collectionist, euros) }
      it { expect(subject).to permit(admin, dollars) }
    end
  end

  context "collectionist over another collection" do
    subject { CollectionPolicy}
    permissions :show?, :new?, :create?, :update?, :edit?, :destroy? do
        it { expect(subject).not_to permit(collectionist, dollars) } 
    end
  end

  context "collectionist may see another collectionist index" do
    subject { CollectionPolicy }
    permissions :index? do
      it { expect(subject).to permit(collectionist, dollars) }
    end
  end
end
