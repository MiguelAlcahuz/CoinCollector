class CoinPolicy < ApplicationPolicy

  def initialize(user, coin)
    @user = user
    @coin = coin
  end

  def index?
     @user.admin? 
  end

  def show?
    @user.admin? 
  end
 
  def create?
    @user.admin? 
  end
 
  def update?
    return true if  @user.admin? 
  end
 
  def destroy?
    return true if  @user.admin? 
  end
 
end