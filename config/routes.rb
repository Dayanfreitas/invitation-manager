Rails.application.routes.draw do
  devise_for :users, 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout'
    }, 
    controllers: {
      sessions: 'users/sessions', 
      registration: 'users/registrations'
    }

  devise_scope :user do
    get "logout", to: "users/sessions#destroy"
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items
    end
  end

  root to: 'home#index'
end
