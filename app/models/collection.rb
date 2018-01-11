class Collection < ApplicationRecord
  has_many :coins
  belongs_to :user
  
  def total_amount
  	
  end

  def sumTotalAmount
  end
  
end
