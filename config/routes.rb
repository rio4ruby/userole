# frozen_string_literal: true

Rails.application.routes.draw do
  resources :roles, except: :show

  devise_for :users,
             controllers: {
               registrations: 'users/registrations'
             }
  resources :users

  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
