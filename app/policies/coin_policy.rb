class CoinPolicy < ApplicationPolicy
  def index?
    true
  end
 
  def create?
    true
  end
 
  def update?
    true
  end
 
  def destroy?
    true
  end
 
  private
 
    def article
      record
    end
end