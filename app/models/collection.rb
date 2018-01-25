class Collection < ApplicationRecord
  has_many :coins
  belongs_to :user
  validates :currency, presence: true, uniqueness: true

  def my_owner_username
  	self.user.username
  end

  def total_amount
  	
  end

  def sumTotalAmount
  end
  
end
