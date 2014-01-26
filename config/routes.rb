Bss::Application.routes.draw do
  scope :api do
    resources :users, defaults: {format: :json}
  end
  root 'home#index'
end
