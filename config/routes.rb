Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]

  resources :users, only: [:show, :index, :new, :create, :edit, :update] do 
  	resources :mirrors
  end

  # patch '/users/:id/posts/', to: 'posts#update'
  root 'users#index'
  get '/logout' => 'sessions#destroy'
end
