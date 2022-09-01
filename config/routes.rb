# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :userlists
  resources :candidateslists
  resources :voterslists
  resources :requests
  resources :schedules
  resources :constituencies
  root to: 'home#index'
  resources :users do
    collection do
      get '/candidates', to: 'users#candidates'
      get '/voters', to: 'users#voters'
    end
  end
end
