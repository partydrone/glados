Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /(?:[a-z]{2,2})(?:[-|_](?:[A-Z]{2,2}))?/ do

    ##
    # Authentication routes

    get '/auth/identity', to: 'sessions#new', as: :sign_in
    get '/auth/failure', to: 'identities#authentication_failure'
    post '/auth/:provider/callback', to: 'sessions#create'
    get '/sign_out', to: 'sessions#destroy'

    resources :identities, only: [:new]

    resources :products

    root to: 'home#index'
  end
end
