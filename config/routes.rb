Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :lists
  end
  
  resources :movies
  
  root 'movies#index'


end
