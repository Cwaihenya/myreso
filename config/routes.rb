Rails.application.routes.draw do

  get 'users/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show, :index]

  resources :resolutions do
        resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do

  authenticated :user do
    root 'resolutions#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
match '/users/:id',     to: 'users#show',       via: 'get'

match '/users',   to: 'users#index',   via: 'get'
root to: 'resolutions#index'
resources :users
resources :tasks
post '/resolution/task/:id' => 'task#completed_task', as: 'completed_task'
resources :conversations do
  resources :messages
end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
end
