Rails.application.routes.draw do
<<<<<<< HEAD
  if defined?(JasmineRails)
    mount JasmineRails::Engine => '/specs'
    mount JasmineFixtureServer => '/spec/javascripts/fixtures'
  end

=======
  
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
>>>>>>> 844961666cf621de283e36dc5fa456c7fdfc92fd
  root 'home#index'
  get 'home/index'
  post 'key_location/new'
  post 'key_location/assign'
  get  'key_location/destroy'
  delete 'key_location/destroy'
  
  get 'sessions/new'
  get 'users/new'
  get 'users/following'
  
  post 'home/search_friends'
  post 'users/profile'
  post 'users/following'
  delete 'users/destroy'
  
  post 'sessions/user_params'
  
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
