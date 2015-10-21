Rails.application.routes.draw do
  root "home#index"

  devise_for :users, :controllers => { 
    sessions: "users/sessions", 
    :omniauth_callbacks => "users/omniauth_callbacks", 
    registrations: "users/registrations", 
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    unlocks: "users/unlocks"
 }

  resources :urls

  namespace :users do
    resources :connects, only: :index do
      collection do 
        get "approve"
        delete "unconnect"
      end
    end
  end

  namespace :dashboard do
    get "/" => "home#index"
    get "/my_links" => "urls#my_links"
    resources :statistics, only: :index do
      collection do
        get "browser"
        get "os"
        get "country"
        get "device_type"
        get "clicks"
      end
    end
  end

  match '*a', :to => 'urls#routing_error', via: :get
end
