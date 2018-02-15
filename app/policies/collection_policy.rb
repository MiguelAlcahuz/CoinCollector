class CollectionPolicy < ApplicationPolicy
  
  def initialize(user, collection)
    @user = user
    @collection = collection
  end

  def index?
    @user.collectionist? || @user.admin? 
  end

  def show?
    belongs_to_user? || @user.admin?
  end
 
  def create?
     true
  end
 
  def update?
    return true if @user.admin? || belongs_to_user?
  end
 
  def destroy?
    return true if @user.admin? || belongs_to_user?
  end
 

  private

  def belongs_to_user?
    @collection.user_id == @user.id
  end
end