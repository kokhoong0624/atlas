Rails.application.routes.draw do
  get 'homepage/index'
  resources :pastes
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/search' => 'pastes#search', as: "search"

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
