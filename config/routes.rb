Rails.application.routes.draw do
  root "home#index"

  devise_for :users, :controllers => { sessions: "users/sessions", :omniauth_callbacks => "users/omniauth_callbacks", registrations: "users/registrations" }

  resources :urls do
  end

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
  end

  match '*a', :to => 'urls#routing_error', via: :get
end
