class Collection < ApplicationRecord
  has_and_belongs_to_many :coins
  belongs_to :user
  validates :currency, presence: true, uniqueness: true

  def my_owner_username
  	self.user.username
  end
end
