class UsersController < ApplicationController

	respond_to :json

	def index
		respond_with User.all
	end

	def show
		respond_with User.find(params[:id])
	end

	def create
		respond_with User.create(user_params)
	end

	def update
		user = User.find(params[:id])
		response = user.update_attributes(user_params)
		if response
			respond_with response
		else
			respond_with user
		end
	end

	def destroy
		respond_with User.destroy(params[:id])
	end

	private

		def user_params
			params.require(:user).permit(:name, :email)
		end

end
