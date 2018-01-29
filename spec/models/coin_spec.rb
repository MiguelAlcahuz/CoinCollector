require 'rails_helper'

RSpec.describe Coin, type: :model do
 it { is_expected.to validate_numericality_of(:year) }
 it {is_expected.to validate_presence_of(:year) }
 it {is_expected.to validate_presence_of(:country) }
 it {is_expected.to validate_presence_of(:value) }
 it { is_expected.to belong_to(:collection) }


  describe '#coin_validator'do
    context 'when the given year earlier than the introduced_euro year' do
      it 'returns false' do
        year = 2008
        andorracoin = Coin.new(country: 'andorra', year: year)
        expect(andorracoin.valid?).to be false
      end
    end
    context 'when the given year is equal or later than the introduced_euro year' do
      it 'returns true' do
        year = 2015
        andorracoin = Coin.new(country: 'andorra', year: year)
        expect(andorracoin.valid?).to be true
      end
      it 'returns true' do
        year = 2018
        andorracoin = Coin.new(country: 'andorra', year: year)
        expect(andorracoin.valid?).to be true
      end
    end

  end

end