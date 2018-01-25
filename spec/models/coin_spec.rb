require 'rails_helper'

RSpec.describe Coin, type: :model do

 it { is_expected.to belong_to(:collection) }
end