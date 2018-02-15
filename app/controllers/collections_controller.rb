class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /collections
  # GET /collections.json
  def index
    if current_user.admin?
      @collections = Collection.all
    else
      @collections = Collection.where(user_id: current_user.id) 
    end
    authorize @collections
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
    authorize @collection
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)
    @collection.user = current_user
    authorize @collection
    if @collection.valid? && @collection.id_validation? && Collection.exists?(@collection.id) == false
      respond_to do |format|
        if @collection.save 
          format.html { redirect_to collections_path, notice: 'Collection was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to collection_coins_path(@collection), notice: 'Collection was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
      authorize @collection
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:currency, :user_id)
    end
end
