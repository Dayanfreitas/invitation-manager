Rails.application.routes.draw do
  devise_for :users, 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }, 
    controllers: {
      sessions: 'users/sessions', 
      registrations: 'users/registrations'
    }

  devise_scope :user do
    get "logout", to: "users/sessions#destroy"
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index]
      resources :invitations, only: [:create]
    end
  end

  resources :companies
  resources :invitations
  root to: 'home#index'
end
