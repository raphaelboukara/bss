Bss::Application.routes.draw do

  scope :api do
    resources :users, defaults: {format: :json} do
		resources :clients, defaults: {format: :json}
	end
	resources :sessions, only: [:new, :create, :destroy], defaults: {format: :json}
  end

  root 'home#index'
  
end
