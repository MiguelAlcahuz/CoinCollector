class Collection < ApplicationRecord
  has_and_belongs_to_many :coins
  belongs_to :user
  validates :currency, presence: true, uniqueness: true
  validate :collection_validator

  def id_validation?
  	user_id == user&.id 
  end
  	
  def collection_validator
  	errors.add(:user_id, "not the user of this collection") unless id_validation?
  end

  def my_owner_username
  	self.user.username
  end
end
