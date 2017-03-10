Rails.application.routes.draw do
  get 'articles/index'

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  root to: 'visitors#index'
end
