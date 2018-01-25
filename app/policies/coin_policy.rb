class CoinPolicy < ApplicationPolicy

  def initialize(coin, collection, user)
    @coin = coin
    @collection = collection
    @user = user
  end

  def index?
    (belongs_to_user? && belongs_to_collection?) || user.admin? 
  end

  def show?
    (belongs_to_user? && belongs_to_collection?) || user.admin? 
  end
 
  def create?
    (belongs_to_user? && belongs_to_collection?) || user.admin? 
  end
 
  def update?
    return true if (belongs_to_user? && belongs_to_collection?) || user.admin? 

 
  def destroy?
    return true if (belongs_to_user? && belongs_to_collection?) || user.admin? 

  end
 
  private
 
    def belongs_to_collection?
      @collection.id = @coin.collection_id
    end

    def belongs_to_user?
    @collection.user_id == @user.id
  end
end