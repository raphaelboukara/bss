class ClientsController < ApplicationController

	respond_to :json
	before_action :correct_user

	def index
		respond_with current_user.clients
	end

	def show
		respond_with current_user.clients.find(params[:id])
	end

	def create
		respond_with(current_user.clients.create(client_params), :location => user_clients_url) 
	end

	def update
		client = Client.find(params[:id])
		response = client.update_attributes(client_params)
		if response
			respond_with response
		else
			respond_with client
		end
	end

	def destroy
		respond_with Client.destroy(params[:id])
	end

	private

		def client_params
			params.require(:client).permit(:name, :email, :user_id)
		end

		def correct_user
			if !signed_in?
				error = {:error => "You are not connected"}
				respond_with error, :status => 401, :location => new_session_url
			end
		end
end
