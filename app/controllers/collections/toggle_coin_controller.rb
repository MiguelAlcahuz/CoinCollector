class Collections::ToggleCoinController < ApplicationController
	
	#def edit_coin_from_collection
	#	@coin = @collection.coins.find(params[:coin_id])
	#	@newcoin = Coin.new(coin_params)
	#end

	def add_coin_to_collection	
    @collection = Collection.find(params[:id])
    @collection.coins << Coin.find(params[:coin_id])
	end
end
