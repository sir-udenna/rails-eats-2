Rails.application.routes.draw do
  devise_for :users
  
  resources :likes
  resources :follows
  resources :categories
  resources :photos
  resources :reviews
  resources :businesses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
