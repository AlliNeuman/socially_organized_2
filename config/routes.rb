Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/dashboard', to: 'users#dashboard'

#these routes are for showing user login form, logging them in and logging them out
  get 'signup', to: 'users#new', as: 'signup'
  post 'users', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :posts

  resources :users, only: [:show] do
    resources :calendars, only: [:show, :index, :new, :create]
  end

  resources :calendars, only: [:show] do
    resources :posts
  end

  resources :calendars, only: [:show] do
    resources :users, only: [:index, :new, :create, :destroy]
  end

end
