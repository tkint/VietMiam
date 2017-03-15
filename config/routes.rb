Rails.application.routes.draw do
  namespace :admin do
    resources :articles, only: [:new, :edit, :create, :update, :destroy]
    resources :recipes, only: [:new, :edit, :create, :update, :destroy]
  end

  resources :articles, only: [:index, :show]
  resources :recipes, only: [:index, :show]

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'visitors#index'
end
