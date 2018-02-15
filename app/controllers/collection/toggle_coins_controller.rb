class Collection::ToggleCoinsController < ApplicationController
	
	def destroy
		@collection = Collection.find(params[:id])
		if @collection.coins.include?(Coin.find(params[:toggle_coin_id]))
			@collection.coins.delete(Coin.find(params[:toggle_coin_id]))
			respond_to do |format| 
				format.html {redirect_to collection_coins_path(@collection), notice: 'Collection was successfully updated.'}
				format.js
			end
		else
			redirect_to collection_coins_path(@collection), notice: 'Coin unable to be delated from the collection.'
		end

	end

	def update
    @collection = Collection.find(params[:id])
    @coin = Coin.find(params[:toggle_coin_id])
    if @collection.coins.include?(@coin)
    	redirect_to collection_coins_path(@collection), notice: 'Unable to successfully update.' 
  	else
	    @collection.coins << Coin.find(params[:toggle_coin_id])
	    respond_to do |format| 
	    	format.html {redirect_to collection_coins_path(@collection), notice: 'Collection was successfully updated.' }
	    	format.js
  		end
  	end
	end
end
