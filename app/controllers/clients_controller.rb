class ClientsController < ApplicationController

	respond_to :json

	def index
		respond_with User.find(params[:user_id]).clients
	end

	def show
		respond_with User.find(params[:user_id]).clients.find(params[:id])
	end

	def create
		user = User.find(params[:user_id]);
		respond_with(user.clients.create(client_params), :location => user_clients_url) 
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
end
