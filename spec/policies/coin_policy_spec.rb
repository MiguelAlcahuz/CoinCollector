require 'rails_helper'

RSpec.describe CoinPolicy type: :policy do

  let(:collectionist) {User.new(id: 1, email: 'mikelacahuz@gmail.com', username: 'el collecionista', roles: 'collectionist')}
  let(:admin) {User.new(id: 2, email: 'miguelalcahuz@gmail.com', username: 'iamthebosshere', roles: 'admin' )}
  let(:moneda1) {Coin.new(country: "andorra", value: 0.01, year: 2015, collection_id: 1)}
  let(:euros) {Collection.new(id: 1, currency: 'euros', user_id: 1)}
  let(:dollars) {Collection.new(id: 2, currency: 'dollars', user_id: 2)}

  # admin can CRUD every coin from every collection from any user
  context "for a coin that belongs to its collection and user is admin or collectionist" do
    subject { CoinPolicy }
    permissions :show?, :new?, :create?, :index?, :update?, :edit?, :destroy? do
      it { expect(subject).to permit(moneda1, euros, admin) }
      it { expect(subject).to permit(moneda1, euros, collectionist) }
    end
  end 

  #if a coin does not belong to its respective collection either admin nor collectionist can do nothing to it
  context "for a coin that DOES NOT belong to its collection and user is admin or collectionist" do
    subject { CoinPolicy }
    permissions :show?, :new?, :create?, :index?, :update?, :edit?, :destroy? do
      it { expect(subject).not_to permit(moneda1, dollars, admin) }
      it { expect(subject).not_to permit(moneda1, dollars, collectionist) }
    end
  end 
end