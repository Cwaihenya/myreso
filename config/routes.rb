Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
        sessions: 'users/sessions'
      }

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
resources :users
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
end
