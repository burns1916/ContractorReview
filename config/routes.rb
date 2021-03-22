Rails.application.routes.draw do
  root 'welcome#home'
  get '/signup' => 'welcome#signup'
  get '/contractor/signup' => 'contractors#new'
  post '/contractor/signup' => 'contractors#create'
  get '/client/signup' => 'clients#new'
  post '/client/create' => 'clients#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#googlelogin'


  resources :reviews
  resources :appointments do
    resources :reviews, only: [:new, :create, :index]
  end
  resources :contractors do
    resources :appointments, only: [:new, :create, :index]
    resources :reviews, only: [:index]
  end
  resources :clients do
    resources :appointments, only: [:new, :create, :index] do
      resources :reviews, only: [:new, :create, :index]
    end
    resources :reviews, only: [:new, :create, :index]
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
