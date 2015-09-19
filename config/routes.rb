Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  
  root 'categories#index'
  
  resources :videos, only: [:index, :show]
  
  resources :categories, only: [:index, :show]
end
