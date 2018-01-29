class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :edit, :update, :destroy]
  before_action :set_collection, only: [:new, :create, :update, :edit, :destroy, :index]
  # GET /coins
  # GET /coins.json
  def index
    if params[:country].blank?
      params[:country] = "andorra"
    end
    @coins = Coin.find_by(params[:collection_id])
    #authorize @coin
  end

  # GET /coins/1
  # GET /coins/1.json
  def show
  end

  # GET /coins/new
  def new
    @coin = Coin.new
    authorize @coin
  end

  # GET /coins/1/edit
  def edit
  end

  # POST /coins
  # POST /coins.json
  def create
    @coin = Coin.new(coin_params)
    @coin.collection = @collection
    respond_to do |format|
      if @coin.save
        format.html { redirect_to collection_coins_path(@coin.collection), notice: 'Coin was successfully created.' }
        format.json { render :show, status: :created, location: @coin }
      else
        format.html { render :new }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coins/1
  # PATCH/PUT /coins/1.json
  def update
    
    respond_to do |format|
      if @coin.update(coin_params)
        format.html { redirect_to collection_coins_path, notice: 'Coin was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin }
      else
        format.html { render :edit }
        format.json { render json: @coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coins/1
  # DELETE /coins/1.json
  def destroy
    @coin.collection = @collection
    @coin.destroy
    respond_to do |format|
      format.html { redirect_to collection_coins_path(@coin.collection), notice: 'Coin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
      authorize @coin
    end

    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coin_params
      params.require(:coin).permit(:year, :country, :value)
    end
end
