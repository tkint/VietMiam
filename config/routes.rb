Rails.application.routes.draw do
  scope '/', controller: :error_pages do
    get 'error_404'
    get 'unauthorized'
  end

  resources :articles
  resources :comments, path: '/articles/comments'
  resources :recipes
  resources :user_groups

  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  resources :users

  root to: 'visitors#index'
end
