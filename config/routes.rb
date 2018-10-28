Rails.application.routes.draw do
  # get 'venues/index'
  # get 'venues/new'
  # get 'venues/create'
  # get 'venues/show'
  # get 'venues/edit'
  # get 'venues/update'
  # get 'venues/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'welcome/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



# route that matches to the Google Oauth callback URL
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


# to venue marker address ajax
  get 'venues/marker_address' => 'venues#marker_address', as: "marker_address"


  root 'welcome#show'

  get 'users/new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  resources :venues, only: [:new, :update, :create, :show, :edit, :destroy, :index]


  #   resources :users, controller: "users", only: [:create] do
  #
  # end


end
