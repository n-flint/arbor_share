Rails.application.routes.draw do
  root 'projects#index'
  get '/policy', to: 'policy#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create] do
    resources :addresses, only: [:update]
  end

  namespace :profile do
    get '/', to: 'profile#show'
    get '/edit', to: 'profile#edit'
  end

  namespace :admin do
    resources :projects, only: [:new, :create, :show]
    get '/dashboard', to: 'projects#index'
  end

  resources :projects, only: [:show]
end
