Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  post 'key_location/new'
  post 'key_location/assign'
  get  'key_location/destroy'
  delete 'key_location/destroy'
  
  get 'sessions/new'
  get 'users/new'
  
  post 'home/search_friends'
  post 'users/profile'
  post 'users/following'
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions
  resources :relationships, only: [:create, :destroy]
  
  match '/signup', to: 'users#new', via: :get
  match '/login', to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete

end
