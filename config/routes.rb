Bss::Application.routes.draw do

  scope :api do
    resources :users, defaults: {format: :json} do
		resources :clients, defaults: {format: :json}
	end
  end

  root 'home#index'

end
