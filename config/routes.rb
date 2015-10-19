Rails.application.routes.draw do  
  root "static_pages#home"

  get "statistics" => "static_pages#statistics"

  devise_for :users

  resources :user_goals
  
end
