Rails.application.routes.draw do
	root   'static_pages#home'
  get 'comments/comments'
  get 'sessions/new'

  get 'static_pages/home'

  get 'static_pages/help'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

   resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users do
  resources :microposts do
    resources :comments
  end
end
  resources :microposts
  resources :users
  resources :account_activations, only: [:edit]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :comments
  

  
end
