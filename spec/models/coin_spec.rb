require 'rails_helper'

RSpec.describe Coin, type: :model do
  it {is_expected.to validate_presence_of(:year) }
  it {is_expected.to validate_presence_of(:country) }
  it {is_expected.to validate_presence_of(:value) }
  it {is_expected.to have_and_belong_to_many(:collections)}

  describe '#introduced_euro' do
    context 'when the given year is earlier than introduction year' do 
      it 'return false' do
        expect(Coin.introduced_euro('andorra')).to be 2015
      end
    end
  end

  describe '#year_is_valid?'do
    context 'when the given year does not exists' do
      it 'returns false' do
        invalid_year = 2004
        andorracoin = Coin.new(country: 'andorra', year: invalid_year, value: "onecent")
        expect(andorracoin.year_is_valid?).to be false
      end
    end
    context 'when the given year exists' do
      it 'returns true' do
        valid_year = 2018
        andorracoin = Coin.new(country: 'andorra', year: valid_year, value: "onecent")
        expect(andorracoin.year_is_valid?).to be true
      end
    end
  end

  describe '#validations'do
    context 'when the given year earlier or later than the introduced_euro year' do
      it 'returns false' do
        year = 2008
        andorracoin = Coin.new(country: 'andorra', year: year, value: "onecent")
        expect(andorracoin.valid?).to be false
      end
      it 'returns false' do
        year = Date.current.year + 1
        andorracoin = Coin.new(country: 'andorra', year: year, value: "onecent")
        expect(andorracoin.valid?).to be false
      end
    end

    context 'when the given year is equal or later than the introduced_euro year' do
      it 'returns true' do
        year = 2015
        andorracoin = Coin.new(country: 'andorra', year: year, value: "onecent")
        expect(andorracoin.valid?).to be true
      end
      it 'returns true' do
        year = 2018
        andorracoin = Coin.new(country: 'andorra', year: year, value: "onecent")
        expect(andorracoin.valid?).to be true
      end
    end
  end
end