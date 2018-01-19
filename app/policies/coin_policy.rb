class CoinPolicy < ApplicationPolicy
  def index?
    true
    #user.collectionist? || user.admin?
  end
 
  def create?
    user.collectionist?
  end
 
  def update?
    return true if user.collectionist?
  end
 
  def destroy?
    return true if user.collectionist? 
  end
 
  private
 
    def article
      record
    end
end