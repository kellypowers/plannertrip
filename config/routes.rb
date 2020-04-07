Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  root 'welcome#home'
  resources :sessions, only: [:new, :create, :destroy]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/sessions' => "sessions#create"
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  
  resources :users do 
    resources :planners do 
      resources :events 
    end
  end

  resources :events 

  

end
