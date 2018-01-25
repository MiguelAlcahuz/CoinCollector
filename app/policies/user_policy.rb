class UserPolicy < ApplicationPolicy

  def initialize(user, logged_user)
    @user = user
    @logged_user = logged_user
  end

  def index?
    @user.admin? || @logged_user.admin? 
  end

  def show?
    @user.admin? || @logged_user.admin? 
  end
 
  def create?
    @user.admin? || @logged_user.admin? 
  end
 
  def update?
    return true if @user.admin? || @logged_user.admin? 
  end
 
  def destroy?
    return true if @user.admin? || @logged_user.admin? 
  end
end