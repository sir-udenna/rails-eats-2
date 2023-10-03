Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations', sessions: 'users/sessions' }


  resources :likes
  resources :follows
  resources :categories
  resources :photos
  resources :reviews
  resources :businesses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # post '/users/sign_in', to: 'users/sessions#create', defaults: { format: :json }
  # delete '/users/sign_out', to: 'users/sessions#destroy', defaults: { format: :json }

  get '/api/yelp_restaurants', to: 'yelp_restaurants#search', defaults: { format: :json }

end
