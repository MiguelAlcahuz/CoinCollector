require 'rails_helper'

RSpec.describe Collection, type: :model do

  it { is_expected.to validates_uniqueness_of(:currency) }
  it  { is_expected.to have_many(:coins)}
  it  { is_expected.to belong_to(:user)}
end