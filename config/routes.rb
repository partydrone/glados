Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /(?:[a-z]{2,2})(?:[-|_](?:[A-Z]{2,2}))?/ do

    ##
    # Authentication routes
    get '/auth/identity', to: 'sessions#new', as: :sign_in
    get '/auth/failure', to: 'identities#authentication_failure'
    post '/auth/:provider/callback', to: 'sessions#create'
    delete '/sign_out', to: 'sessions#destroy'

    ##
    # Content management interface
    namespace :admin do
      ##
      # Concerns
      concern :sortable do
        post :sort, on: :collection
      end

      ##
      # Resource routes
      resources :blog_posts,
                :case_studies,
                :downloads,
                :features,
                :patents,
                :product_categories,
                :products,
                :return_material_authorization_policy_documents,
                :sales_terms_and_conditions_documents,
                :training_course_types,
                :training_courses,
                :training_events,
                :users,
                :website_privacy_policy_documents,
                :website_terms_of_use_documents

      resources :download_types, :product_categories, :product_types, concerns: :sortable

      ##
      # Admin root route
      root to: 'base#index'
    end

    ##
    # Concerns
    concern :listable do
      get :list, on: :collection
    end

    concern :sortable do
      post :sort, on: :collection
    end

    ##
    # Resource routes
    resources :demo_requests, :marketing_app_support_requests, only: [:create]

    resources :identities, only: [:new]

    resources :blog_posts,
              :case_studies,
              :downloads,
              :features,
              :patents,
              :product_categories,
              :return_material_authorization_policy_documents,
              :sales_terms_and_conditions_documents,
              :training_course_types,
              :training_courses,
              :training_events,
              :users,
              :website_privacy_policy_documents,
              :website_terms_of_use_documents

    resources :products, concerns: :listable

    resources :download_types, :product_categories, :product_types, concerns: :sortable

    ##
    # Static routes
    get '/about', to: 'about#index'
    get '/contact', to: 'contact#index'
    get '/jobs', to: redirect('http://wavetronix.recruiterbox.com/jobs')
    get '/legal', to: 'legal#index'
    get '/news_events', to: 'about#news_events'
    get '/training', to: 'training#index'

    namespace :support do
      get '/marketing_app', to: 'marketing_app#index'
      root to: 'base#index'
    end

    ##
    # Root route
    root to: 'home#index'
  end
end
