Rails.application.routes.draw do
	

  get 'static_pages/home'

  get 'static_pages/help'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :microposts
  resources :users
  root 'users#index'
end
