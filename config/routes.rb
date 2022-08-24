Rails.application.routes.draw do
  get 'candidateslists/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :userlists
  resources :candidateslists
  resources :voterslists
  root to: "home#index"
end

