Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenida", to: "home#index"
  get "edit/user", to: "users#edit"
  resources :users, only: [:update]

  root to: "home#index"
  
  #get "articles/user/:user_id", to: "articles#from_author"

  resources :categories
  resources :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection
  end


  #get "articles", to: "articles#index"
  
  #get "articles/new", to: "articles#new", as: :new_articles
  #get "articles/:id", to: "articles#show"
  #get "articles/:id/edit", to: "articles#edit"

  #post "articles", to: "articles#create"

  #patch "/articles/:id", to: "articles#update", as: :article
  #delete "articles/:id", to: "articles#destroy"
  
end
