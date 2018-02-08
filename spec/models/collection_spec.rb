require 'rails_helper'

RSpec.describe Collection, type: :model do

  it { is_expected.to validate_uniqueness_of(:currency) }
  it  { is_expected.to have_and_belong_to_many(:coins)}
  it  { is_expected.to belong_to(:user)}

  describe 'return username' do
    context 'when i initialize a collection' do 
      it 'returns the name of the user' do
      	u = User.create(id:5, email: "miguel@gmail.com", password: "12341234", username: "H")
      	c = Collection.create(currency: "euros", user_id: 5)
        expect(c.my_owner_username).to eql("H")
      end
    end
  end

  describe "#validations" do
    context 'when the collection is correctly created' do
      it 'returns true when assigned to the correct user' do
      	u = User.create(id:7, email: "miguel@gmail.com", password: "12341234", username: "H")
      	c = Collection.new(currency: "eur", user_id: 7)
        expect(c.id_validation?).to be true
      end
    end

    context 'when the collection is correctly created' do
      it 'returns false when not assigned to the correct user' do
      	u = User.create(id:6, email: "migueldasdasd@gmail.com", password: "12341234", username: "Hasasdsda")
      	c = Collection.new(currency: "euasdasdr", user_id: 7)
        expect(c.id_validation?).to be false
      end
    end

     context 'when the collection is correctly created' do
      it 'returns true when assigned to the correct user' do
      	u = User.create(id:7, email: "miguel@gmail.com", password: "12341234", username: "H")
      	c = Collection.create(id: 10, currency: "eur", user_id: 7)
        expect(c.valid?).to be true
      end
    end

    context 'when the collection is correctly created' do
      it 'returns false when not assigned to the correct user' do
      	u = User.create(id:6, email: "miguel@gmail.com", password: "12341234", username: "H")
      	c = Collection.create(id: 10, currency: "eur", user_id: 7)
        expect(c.valid?).to be false
      end
    end
  end
end