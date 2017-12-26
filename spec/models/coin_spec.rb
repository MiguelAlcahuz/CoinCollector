require 'spec_helper'

describe Coin do
	it 'year must be inbounds' do
		coin = Coin.new
		coin.year.should
	end
end