Rails.application.routes.draw do
 resources :feedback_from_users, except: [:destroy, :update, :edit, :index, :new, :show]
  devise_for :users, 
          :controllers => { 
          :sessions => "users_sessions", 
          # :registrations => "user_registrations", 
          :passwords => "users_passwords",
          # Proper invitations should be sent through the active_admin interface.
          :invitations => 'users_invitations' # user_invitations_controller.rb
          }
  # devise_for :users
      # ,
      # :controllers => { :invitations => 'users/invitations' }
  ActiveAdmin.routes(self)
  resources :requests
  get 'clockb' => 'pages#clockb'
  get 'services' => 'pages#services'
  get 'careers' => 'pages#careers'
  get 'events' => 'pages#events'
  get 'events/browse', :to => 'pages#browse', :as => 'events_browse'
  get 'events/:id', to: 'pages#browse', :as => 'event_browse'
  get 'dashboard', to: 'pages#dashboard'
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
  root 'pages#home'

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
