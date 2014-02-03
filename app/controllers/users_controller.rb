class UsersController < ApplicationController

	respond_to :json

	def index
		respond_with User.all
	end

	def show
		#respond_with User.find(params[:id])
		if signed_in? 
			respond_with current_user
		else
			error = {:error => "You are not connected"}
			respond_with error, :status => 404, :location => new_session_url
		end
	end

	def create
		#respond_with User.create(user_params)
		@user = User.new(user_params)
	    if @user.save
	      sign_in @user
	      respond_with @user
	    else
	      respond_with @user
	    end
	end

	def update
		response = current_user.update_attributes(user_params)
		if response
			respond_with response
		else
			respond_with current_user
		end
	end

	def destroy
		respond_with User.destroy(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

end
