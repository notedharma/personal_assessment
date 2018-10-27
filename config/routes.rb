Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'welcome/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



# route that matches to the Google Oauth callback URL
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  root 'welcome#show'

  get 'users/new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
end
