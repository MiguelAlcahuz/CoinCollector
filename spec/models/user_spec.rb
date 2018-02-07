require 'rails_helper'

RSpec.describe User, type: :model do
it "has a unique name for username"
it "has a unique email for user"
it { is_expected.to have_many(:collections)}

end
