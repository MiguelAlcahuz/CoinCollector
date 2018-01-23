class Collection < ApplicationRecord
  has_many :coins
  belongs_to :user
  
  def my_owner_username
  	self.user.username
  end

  def total_amount
  	
  end

  def sumTotalAmount
  end
  
end
