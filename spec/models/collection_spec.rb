require 'rails_helper'

RSpec.describe Collection, type: :model do
  it "has a unique name for the collection"
  it  { is_expected.to have_many(:coins)}
  it  { is_expected.to belong_to(:user)}
end