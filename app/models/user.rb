class User < ApplicationRecord
	
	has_many :collections
  
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :authentication_keys => [:login]
  validates :username, uniqueness: true

  enum roles: {
  	collectionist: 0,
  	admin: 1
  }

  def my_user_name
    self.username
  end

  def set_default_role
    self.roles ||= :user
  end

  def login=(login)
  	@login = login
  end

  def login
  	@login || self.username || self.email
  end
  
  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    if conditions[:username].nil?
	      where(conditions).first
	    else
	      where(username: conditions[:username]).first
	    end
	  end
	end
end
