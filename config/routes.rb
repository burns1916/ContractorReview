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


  resources :reviews
  resources :appointments
  resources :contractors
  resources :clients
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
