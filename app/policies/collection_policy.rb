class CollectionPolicy < ApplicationPolicy
  def index?
    user.collectionist? || user.admin?
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? 
  end
 
  def destroy?
    return true if user.present? 
  end
 
  private
 
    def article
      record
    end
end