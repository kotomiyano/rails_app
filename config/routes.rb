Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :maps 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  get 'posts' => 'posts#index'
  get 'posts/new' => 'posts#new'
  post 'posts' => 'posts#create'
  
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy'
  
  
  root 'hello#index'
end
