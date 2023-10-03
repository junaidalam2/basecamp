Rails.application.routes.draw do
  devise_for :users

  #devise_for :users do
  #  get "/users/sign_out" => "devise/sessions#destroy", :as => :destroy_user_session
  #end


  resources :comments
  resources :issues
  resources :projects
  resources :users
  # get 'home/index
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
