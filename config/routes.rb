Rails.application.routes.draw do
  resources :flights
  resources :bookings, :only => [:new, :create, :destroy, :show]
  resources :passengers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "flights#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
