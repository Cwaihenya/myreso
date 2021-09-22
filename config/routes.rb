Rails.application.routes.draw do

  resources :blogs do
  resources :comments
  end
  get 'relationships/create'
  get 'relationships/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show, :index]

  resources :resolutions do
        resources :tasks
      end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do

  authenticated :user do
    root 'blogs#index', as: :authenticated_root
  end
  get '/home' => 'users#home'
  unauthenticated do
    root 'home#home', as: :unauthenticated_root
  end
end
match '/users/:id',     to: 'users#show',       via: 'get'

match '/users',   to: 'users#index',   via: 'get'
root to: 'homes#home'
resources :relationships, only: [:create, :destroy]
resources :tasks
post '/resolution/task/:id' => 'task#completed_task', as: 'completed_task'
resources :conversations do
  resources :messages
end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
