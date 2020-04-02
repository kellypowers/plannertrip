Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', to: 'session#create', via: [:get, :post]
  root 'welcome#home'
  resources :session, only: [:new, :create, :destroy]
  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  
  resources :users

  resources :events do 
    resources :addresses 
  end

  
  resources :locations do 
    resources :addresses
  end
end
