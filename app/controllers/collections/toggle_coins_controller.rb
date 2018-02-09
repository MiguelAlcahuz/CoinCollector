class Collections::ToggleCoinsController < ApplicationController
	
	def destroy
		@collection = Collection.find(params[:id])
		@collection.coins.delete(params[:coin_id])
	end

	def create
    @collection = Collection.find(params[:id])
    @collection.coins << Coin.find(params[:coin_id])
	end
end
