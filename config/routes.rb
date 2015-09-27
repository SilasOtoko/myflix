Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  
  root 'pages#front'
  get 'home', to: "videos#index"
  get 'register', to: "users#new"
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  
  resources :videos, only: [:index, :show] do
    collection do
      get '/search', to: "videos#search"
    end
    resources :reviews, only: [:create] 
  end
  
  resources :categories, only: [:index, :show]
  resources :users, only: [:create]
  resources :sessions, only: [:create]
end
