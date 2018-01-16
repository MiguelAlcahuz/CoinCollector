class CollectionPolicy < ApplicationPolicy
  def index?
    user.present?
  end
 
  def create?
    user.present?
  end
 
  def update?
    return true if user.present? && user == collection.user
  end
 
  def destroy?
    return true if user.present? && user == collection.user
  end
 
  private
 
    def article
      record
    end
end