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
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
      post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
    end
  authenticated :user do
    root 'blogs#index', as: :authenticated_root
  end

  unauthenticated do
    root 'home#home', as: :unauthenticated_root
  end




root to: 'home#home'
resources :relationships, only: [:create, :destroy]
resources :tasks

resources :conversations do
  resources :messages
end
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
