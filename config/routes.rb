Rails.application.routes.draw do
  get 'page/about'
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :comments, only: [:create,:destroy]
  resources :articles do
    resources :likes, only: [:create,:destroy], shallow: true
    resources :comments, only: [:create,:destroy], shallow: true
  end
  resources :categories
  resources :users, except: [:new,:show] 
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/like_post', to: 'articles#like_post'
  get '/comment_post', to: 'articles#comment_post'
  get 'category_search', to: 'articles#category_search'
get "/download_pdf" => "articles#download_pdf", :as => 'download_pdf'
end
