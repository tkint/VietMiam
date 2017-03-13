Rails.application.routes.draw do
  resources :articles
  resources :receipes

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'visitors#index'
end
