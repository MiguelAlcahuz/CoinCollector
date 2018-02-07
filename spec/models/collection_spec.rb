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
end