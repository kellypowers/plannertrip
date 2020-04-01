Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  root 'welcome#home'
  resources :locations do 
    resources :addresses
  end
end
