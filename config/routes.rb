# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :requests, :except => [:edit, :show, :destroy]
  resources :schedules, :only => [:index, :edit, :update]
  resources :constituencies, :only => [:index, :show]
  root to: 'home#index'
  resources :users, :only => [:index, :update] do
    collection do
      get '/candidates', to: 'users#candidates'
      get '/voters', to: 'users#voters'
    end
  end
end
