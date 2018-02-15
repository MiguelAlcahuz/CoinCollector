class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	def index
		if current_user.admin?
			@q = User.ransack(params[:q])
  		@users = @q.result(distinct: true)
		end
	end

	def show
  end

  # GET /collections/new
  def new
		if current_user.admin?
    @user = User.new
		end
  end

  # GET /collections/1/edit
  def edit
  end

  def update
    if current_user.admin?
	    	respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'User was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
	  end  
  end

	def destroy
		if current_user.admin?
			@user.destroy
    	respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    	end
    end
	end

  private

    def set_user
    	@user = User.find(params[:id])
    end
  # Never trust parameters from the scary internet, only allow the white list through.
	  def user_params
	    params.require(:user).permit(:email, :username)
	  end
end