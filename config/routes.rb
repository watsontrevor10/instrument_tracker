Rails.application.routes.draw do
  root "instruments#index"
  
  devise_for :users
  
  resources :instruments
end
