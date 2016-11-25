class UsersController < ApplicationController
  before_action :set_user, only: [:show, :settings, :tickets, :concerts, :edit, :update]
	layout 'layouts/application'
	def show
		@page = 'profile'
		@tab = 'overview'
	end

	def settings
		@page = 'profile'
		@tab = 'settings'
		render 'show'
	end

	def tickets
		@page = 'profile'
		@tab = 'tickets'
		@tickets = @user.tickets
		render 'show'
	end

	def concerts
		@page = 'profile'
		@tab = 'concerts'
		@concerts = @user.concerts
		render 'show'
	end

	def edit
		@page = 'profile'
	end

	def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	def history

	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:f_name, :l_name, :username, :location, :avatar)
    end
end
