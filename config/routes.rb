Rails.application.routes.draw do
  namespace :admin do
    resources :articles, only: [:new, :edit, :create, :update, :destroy]
    resources :recipes, only: [:new, :edit, :create, :update, :destroy]
    resources :users, only: [:new, :edit, :create, :update, :destroy]
    resources :user_groups
  end

  resources :articles, only: [:index, :show]
  resources :recipes, only: [:index, :show]

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }
  resources :users, only: [:index, :show]

  root to: 'visitors#index'
end
