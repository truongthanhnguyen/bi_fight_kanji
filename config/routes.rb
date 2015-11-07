Rails.application.routes.draw do
  root "static_pages#home"

  get "statistics" => "static_pages#statistics"

  devise_for :users  
  resources :user_goals

  get "users/:id" => "users/user#show"
  get "users" => "users/user#index"

  post "users/friend_request" => "users/friend#create"
  delete "users/friend_request" => "users/friend#destroy"
  put "users/friend_request" => "users/friend#update"

end
