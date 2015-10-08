Rails.application.routes.draw do
  root "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  namespace :users do
    resources :connects, only: :index do
      collection do 
        get "approve"
        delete "unconnect"
      end
    end
  end
end
