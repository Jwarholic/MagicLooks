Rails.application.routes.draw do

  resources :sessions, only: [:new, :create]

  resources :users do 
  	resources :mirrors
  end

  resources :mirrors

  # patch '/users/:id/posts/', to: 'posts#update'
  root 'users#index'
  get '/logout' => 'sessions#destroy'
end
