Rails.application.routes.draw do

    get 'message_freelancer' => 'freelancers#message_freelancer'
    get 'book_your_appointment' => 'freelancers#book_your_appointment'
    get 'book_webinar_appointment' => 'freelancers#book_webinar_appointment'
    get 'join_as_a_clock_b_freelancer' => 'freelancers#join_as_a_clock_b_freelancer'
    get 'add_freelance_project' => 'freelancers#add_freelance_project'
  resources :freelancers

  get 'rough', to: 'pages#rough'
   
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  devise_for :users,
        :controllers => { 
          :sessions => "users_sessions", 
          :registrations => "users_registrations", 
          :passwords => "users_passwords",
          # Proper invitations should be sent through the active_admin interface.
          :invitations => "users_invitations" # user_invitations_controller.rb
          # :websites => "users_websites"
        } #, :skip => [:sessions]
  
  devise_scope :user do
    get "/sign_in" => "users_sessions#new"
    post "/sign_in" => "users_sessions#create"
    delete "/sign_out" => "users_sessions#destroy"
    get "/sign_up" => "users_registrations#new"
  end
  ActiveAdmin.routes(self)
  resources :resourcexes, except: [:create, :destroy, :update, :edit, :new, :show], path: "resources"
  resources :usermeetups
  resources :profiles
      get 'get_users' => 'profiles#get_users'
  resources :requests
  resources :users do
    resources :projects
    resources :adverts
    resources :business_requirements
    resources :social_media_links
    resources :networking_requirements
    resources :logo_and_images
    resources :feedback_from_users
    resources :products_and_services
  end



  
  # resources :users_websites
  # resources :users

  get 'freelancers' => 'pages#freelancers'
  get 'clockb' => 'pages#clockb'
  get 'services' => 'pages#services'
  get 'careers' => 'pages#careers'
  get 'events' => 'pages#events'
  get 'events/browse', :to => 'pages#browse', :as => 'events_browse'
  get 'events/:id', to: 'pages#browse', :as => 'event_browse'
  get 'dashboard', to: 'pages#dashboard'
  get 'faqs', to: 'pages#faqs'
  get 'download_animated_video', to: 'pages#download_animated_video'

  get 'complete_profile', to: 'pages#complete_profile'
  put 'complete_profile', to: 'pages#complete_profile'
  root 'pages#home'
  # resources :webinars
  # match '/party/:id', :to => 'webinars#party', :as => :party, :via => :get
  
  # devise_for :members, controllers: { registrations: "registrations" }
  # devise_scope :members do
  #   get 'my-events' => 'members#my_events'
  # end

  # resources :events do
  #   post 'attend', on: :member
  #   delete 'unattend', on: :member
  # end
  # get 'upcoming-events', to: 'events#upcoming'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
