Rails.application.routes.draw do
  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define resources for items and baskets
  resources :items, only: [:index, :show]

  resources :baskets, only: [:show] do
    post 'add_to_basket', to: 'baskets#add_to_basket', as: 'add_to_basket'
  end  


  # Set the root path to the items index page
  root 'items#index'
end

