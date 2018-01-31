class CoinPolicy < ApplicationPolicy

  def initialize(user, coin)
    @user = user
    @coin = coin
  end

  def index?
    belongs_to_collection?  
  end

  def show?
    belongs_to_collection?  
  end
 
  def create?
    belongs_to_collection?  
  end
 
  def update?
    return true if belongs_to_collection?  
  end
 
  def destroy?
    return true if  belongs_to_collection?  
  end
 
  private
 
  def belongs_to_collection?
    
  end
end