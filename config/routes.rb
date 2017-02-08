require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /(?:[a-z]{2,2})(?:[-|_](?:[A-Z]{2,2}))?/ do
    mount Ckeditor::Engine => '/ckeditor'

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
                :features,
                :products,
                :return_material_authorization_policy_documents,
                :sales_terms_and_conditions_documents,
                :training_events,
                :website_privacy_policy_documents,
                :website_terms_of_use_documents

      resources :product_categories, concerns: :sortable

      resources :downloads,
                :media_downloads,
                :patents,
                :training_course_types,
                :training_courses,
                :users,
                except: [:show]

      resources :download_types,
                :product_types,
                except: [:show],
                concerns: :sortable
      ##
      # Admin root route
      root to: 'base#index'
    end

    ##
    # Resource routes
    resources :demo_requests, :marketing_app_support_requests, only: [:create]

    resources :identities, only: [:new]

    resources :blog_posts,
              :case_studies,
              :features,
              :product_categories,
              only: [:show]

    resources :tags, only: [:show], param: :name

    resources :knowledge_base_articles,
              :products,
              :return_material_authorization_policy_documents,
              :sales_terms_and_conditions_documents,
              :website_privacy_policy_documents,
              :website_terms_of_use_documents,
              :training_courses,
              :training_events,
              only: [:index, :show]

    ##
    # Static routes
    get '/about', to: 'about#index'
    get '/contact', to: 'contact#index'
    get '/jobs', to: redirect('http://wavetronix.recruiterbox.com/jobs')
    get '/legal', to: 'legal#index'
    get '/marketing_app', to: 'marketing_app#index'
    get '/news', to: 'news#index'
    get '/support', to: 'support#index'
    post '/support', to: 'support#select_product'
    get '/training', to: 'training#index'

    ##
    # Root route
    root to: 'home#index'
  end
end
