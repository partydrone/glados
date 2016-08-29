Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /(?:[a-z]{2,2})(?:[-|_](?:[A-Z]{2,2}))?/ do

    ##
    # Authentication routes

    get '/auth/identity', to: 'sessions#new', as: :sign_in
    get '/auth/failure', to: 'identities#authentication_failure'
    post '/auth/:provider/callback', to: 'sessions#create'
    delete '/sign_out', to: 'sessions#destroy'

    ##
    # Resource routes

    resources :identities, only: [:new]

    resources :products, :users

    ##
    # Root route

    root to: 'home#index'
  end
end
