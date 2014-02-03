class SessionsController < ApplicationController

	respond_to :json

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
      		respond_with user
		else
			error = {:error => "Invalid email/password combination"}
			respond_with error, :status => 404, :location => new_session_url
		end
	end

	def destroy
		sign_out
		respond_with current_user
	end
	
end
