Rails.application.routes.draw do

  devise_for :users
  
  resources :movies
  resources :lists
  
  root 'movies#index'


end
