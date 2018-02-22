require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /(?:[a-z]{2,2})(?:[-|_](?:[A-Z]{2,2}))?/ do
    mount Ckeditor::Engine => '/ckeditor'

    ##
    # Authentication routes
    get '/auth/identity', to: 'sessions#new', as: :sign_in
    match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    get '/auth/failure', to: 'identities#authentication_failure'
    delete '/sign_out', to: 'sessions#destroy', as: :sign_out

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
                :dealers,
                :features,
                :knowledge_base_articles,
                :products,
                :return_material_authorization_policy_documents,
                :sales_offices,
                :sales_terms_and_conditions_documents,
                :training_events,
                :website_privacy_policy_documents,
                :website_terms_of_use_documents

      resources :downloads,
                :download_types,
                :product_categories,
                concerns: :sortable

      resources :media_downloads,
                :patents,
                :redirect_rules,
                :request_environment_rules,
                :roles,
                :sales_territories,
                :software_downloads,
                :training_course_types,
                :training_courses,
                except: [:show]

      resources :users, except: [:show, :new, :create]

      resources :product_types,
                :sales_regions,
                except: [:show],
                concerns: :sortable

      resources :feature_associations, concerns: :sortable, only: [:sortable]

      ##
      # Admin root route
      root to: 'base#index'
    end

    ##
    # Resource routes
    resources :demo_requests,
              :knowledge_base_article_feedbacks,
              :marketing_app_support_requests,
              only: [:create]

    resources :enrollments, only: [:create, :index]

    resources :training_event_requests, only: [:create, :new]

    resources :identities, only: [:new]

    resources :blog_posts,
              :case_studies,
              :features,
              :product_categories,
              only: [:show]

    resources :tags, only: [:show]

    resources :knowledge_base_articles,
              :return_material_authorization_policy_documents,
              :sales_terms_and_conditions_documents,
              :training_courses,
              :training_events,
              :website_privacy_policy_documents,
              :website_terms_of_use_documents,
              only: [:index, :show]

    resources :results,
              :media_downloads,
              only: [:index]

    resources :products

    resources :knowledge_base_articles do
      get :vote, on: :member
    end

    ##
    # Static routes
    get '/about', to: 'about#index'
    get '/contact', to: 'contact#index'
    get '/careers', to: 'about#careers'
    get '/legal', to: 'legal#index'
    get '/marketing_app', to: 'marketing_app#index'
    get '/news', to: 'news#index'
    get '/support', to: 'support#index'

    post '/locales', to: 'locales#set_locale'
    post '/support', to: 'support#select_product'

    ##
    # Root route
    root to: 'home#index'
  end
end
