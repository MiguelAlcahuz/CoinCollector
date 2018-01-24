class CoinPolicy < ApplicationPolicy
  def index?
    current_user.collectionist? || current_user.admin?
  end
 
  def create?
    current_user.collectionist? || current_user.admin?
  end
 
  def update?
    return true if current_user.collectionist? || current_user.admin?
  end
 
  def destroy?
    return true if current_user.collectionist? || current_user.admin?
  end
 
  private
 
    def article
      record
    end
end