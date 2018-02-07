require 'rails_helper'

RSpec.describe CoinPolicy do
  let(:moneda1) {Coin.new(country: "andorra", value: 0.01, year: 2015)}
  let(:moneda2) {Coin.new(country: "andorra", value: 0.01, year: 2015)}

  let(:collectionist) {User.new(id: 1, email: 'mikelacahuz@gmail.com', username: 'el collecionista', roles: 'collectionist')}
  let(:admin) {User.new(id: 2, email: 'miguelalcahuz@gmail.com', username: 'iamthebosshere', roles: 'admin')}

  # admin can CRUD every coin from every collection from any user
  context "for a coin that belongs to its collection and user is admin or collectionist" do
    subject { CoinPolicy }
    permissions :show?, :new?, :create?, :index?, :update?, :edit?, :destroy? do
      it { expect(subject).to permit(admin, moneda1) }
      it { expect(subject).to permit(admin, moneda2)}
    end
  end 

  #if a coin does not belong to its respective collection either admin nor collectionist can do nothing to it
  context "for a coin that DOES NOT belong to its collection and user is admin or collectionist" do
    subject { CoinPolicy }
    permissions :show?, :new?, :create?, :index?, :update?, :edit?, :destroy? do
      it { expect(subject).not_to permit(collectionist, moneda1) }
      it { expect(subject).not_to permit(collectionist, moneda2) }
    end
  end 
end
