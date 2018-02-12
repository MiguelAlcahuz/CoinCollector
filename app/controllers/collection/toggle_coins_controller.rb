class Collection::ToggleCoinsController < ApplicationController
	
	def destroy
		@collection = Collection.find(params[:id])
		@collection.coins.delete(params[:coin_id])
		redirect_to collection_coins_path(@collection), notice: 'Collection was successfully updated.'
	end

	def update
    @collection = Collection.find(params[:id])
    @collection.coins << Coin.find(params[:coin_id])
    redirect_to collection_coins_path(@collection), notice: 'Collection was successfully updated.' 
	end
end
