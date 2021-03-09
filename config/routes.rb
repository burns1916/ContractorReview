Rails.application.routes.draw do
  root 'welcome#home'
  get '/signup' => 'welcome#signup'
  get '/contractor/signup' => 'contractors#new'
  get '/client/signup' => 'clients#new'

  resources :reviews
  resources :appointments
  resources :contractors
  resources :clients
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
