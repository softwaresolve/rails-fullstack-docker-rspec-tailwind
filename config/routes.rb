# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  default_url_options host: 'localhost:3000' if Rails.env.development?
  # default_url_options host: 'railway.app' if Rails.env.production?

  post '/import_csv', to: 'import_csv#import'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users # , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :dashboard, only: %i[index]

  root to: 'dashboard#index'
  get 'dashboard/:project_name/home', to: 'dashboard#home'

  resources :projects, param: :project_name, only: [:show] do
    member do
      resources :buildings
    end
  end

  get 'pages', to: 'pages#home'

  resources :inspections, only: %i[index new show create update] do
    collection do
      scope 'selects' do
        post :project, to: 'inspections#select_project'
        post :building, to: 'inspections#select_building'
      end
    end

    resources :reports, only: %i[] do
      collection do
        get :rejected
        get :approved
        get :all
      end
    end

    resources :steps, only: %i[show update]
    resources :criterions, only: %i[index show update]
  end

  resources :inspection_components, only: [] do
    get :report_pdf
  end

  # get 'inspection_components/pdf'

  resources :justifications, only: %i[create update]

  resources :units, only: %i[index show]

  get :modal, to: 'pages#modal'

  get '/up/', to: 'up#index', as: :up
  get '/up/databases', to: 'up#databases', as: :up_databases

  get :profile, to: 'profile#index'
  put :profile, to: 'profile#update'

  # get '/auth/instagram/callback', to: 'social_integrations#instagram_callback'
  # get '/auth/:provider/callback', to: 'social_integrations#create'
  # get '/auth/failure', to: 'integrations#index', alert: 'Authentication failed. Please try again.'

  # Sidekiq has a web dashboard which you can enable below. It's turned off by
  # default because you very likely wouldn't want this to be available to
  # everyone in production.
  #
  # Uncomment the 2 lines below to enable the dashboard WITHOUT authentication,
  # but be careful because even anonymous web visitors will be able to see it!
  # require "sidekiq/web"
  # mount Sidekiq::Web => "/sidekiq"
  #
  # If you add Devise to this project and happen to have an admin? attribute
  # on your user you can uncomment the 4 lines below to only allow access to
  # the dashboard if you're an admin. Feel free to adjust things as needed.
  # require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'
  # end

  # Learn more about this file at: https://guides.rubyonrails.org/routing.html
end
