Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]
  resources :mirrors
  resources :users, only: [:show, :index, :new, :create, :edit, :update] do 
  end

  # patch '/users/:id/posts/', to: 'posts#update'
  root 'users#index'
  get '/logout' => 'sessions#destroy'
end
