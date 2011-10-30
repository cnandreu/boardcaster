Boardcaster::Application.routes.draw do

  get "moves/create"

  root :to => "pages#home"
  
  match '/contact', :to => 'pages#contact'
  match '/help',    :to => 'pages#help'
  match '/about',   :to => 'pages#about'
  
  get "logout" => "sessions#destroy", :as => "logout"  
  get "login" => "sessions#new", :as => "login"  
  get "signup" => "users#new", :as => "signup"  
  get "create" => "games#new", :as => "create"
  
  resources :users  
  resources :sessions 
  resources :games
  resources :comments
  resources :favorites
  resources :moves
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
#== Route Map
# Generated on 30 Oct 2011 15:41
#
#          root        /                             {:controller=>"pages", :action=>"home"}
#       contact        /contact(.:format)            {:controller=>"pages", :action=>"contact"}
#          help        /help(.:format)               {:controller=>"pages", :action=>"help"}
#         about        /about(.:format)              {:controller=>"pages", :action=>"about"}
#        logout GET    /logout(.:format)             {:action=>"destroy", :controller=>"sessions"}
#         login GET    /login(.:format)              {:action=>"new", :controller=>"sessions"}
#        signup GET    /signup(.:format)             {:action=>"new", :controller=>"users"}
#        create GET    /create(.:format)             {:action=>"new", :controller=>"games"}
#         users GET    /users(.:format)              {:action=>"index", :controller=>"users"}
#               POST   /users(.:format)              {:action=>"create", :controller=>"users"}
#      new_user GET    /users/new(.:format)          {:action=>"new", :controller=>"users"}
#     edit_user GET    /users/:id/edit(.:format)     {:action=>"edit", :controller=>"users"}
#          user GET    /users/:id(.:format)          {:action=>"show", :controller=>"users"}
#               PUT    /users/:id(.:format)          {:action=>"update", :controller=>"users"}
#               DELETE /users/:id(.:format)          {:action=>"destroy", :controller=>"users"}
#      sessions GET    /sessions(.:format)           {:action=>"index", :controller=>"sessions"}
#               POST   /sessions(.:format)           {:action=>"create", :controller=>"sessions"}
#   new_session GET    /sessions/new(.:format)       {:action=>"new", :controller=>"sessions"}
#  edit_session GET    /sessions/:id/edit(.:format)  {:action=>"edit", :controller=>"sessions"}
#       session GET    /sessions/:id(.:format)       {:action=>"show", :controller=>"sessions"}
#               PUT    /sessions/:id(.:format)       {:action=>"update", :controller=>"sessions"}
#               DELETE /sessions/:id(.:format)       {:action=>"destroy", :controller=>"sessions"}
#         games GET    /games(.:format)              {:action=>"index", :controller=>"games"}
#               POST   /games(.:format)              {:action=>"create", :controller=>"games"}
#      new_game GET    /games/new(.:format)          {:action=>"new", :controller=>"games"}
#     edit_game GET    /games/:id/edit(.:format)     {:action=>"edit", :controller=>"games"}
#          game GET    /games/:id(.:format)          {:action=>"show", :controller=>"games"}
#               PUT    /games/:id(.:format)          {:action=>"update", :controller=>"games"}
#               DELETE /games/:id(.:format)          {:action=>"destroy", :controller=>"games"}
#      comments GET    /comments(.:format)           {:action=>"index", :controller=>"comments"}
#               POST   /comments(.:format)           {:action=>"create", :controller=>"comments"}
#   new_comment GET    /comments/new(.:format)       {:action=>"new", :controller=>"comments"}
#  edit_comment GET    /comments/:id/edit(.:format)  {:action=>"edit", :controller=>"comments"}
#       comment GET    /comments/:id(.:format)       {:action=>"show", :controller=>"comments"}
#               PUT    /comments/:id(.:format)       {:action=>"update", :controller=>"comments"}
#               DELETE /comments/:id(.:format)       {:action=>"destroy", :controller=>"comments"}
#     favorites GET    /favorites(.:format)          {:action=>"index", :controller=>"favorites"}
#               POST   /favorites(.:format)          {:action=>"create", :controller=>"favorites"}
#  new_favorite GET    /favorites/new(.:format)      {:action=>"new", :controller=>"favorites"}
# edit_favorite GET    /favorites/:id/edit(.:format) {:action=>"edit", :controller=>"favorites"}
#      favorite GET    /favorites/:id(.:format)      {:action=>"show", :controller=>"favorites"}
#               PUT    /favorites/:id(.:format)      {:action=>"update", :controller=>"favorites"}
#               DELETE /favorites/:id(.:format)      {:action=>"destroy", :controller=>"favorites"}
#         moves GET    /moves(.:format)              {:action=>"index", :controller=>"moves"}
#               POST   /moves(.:format)              {:action=>"create", :controller=>"moves"}
#      new_move GET    /moves/new(.:format)          {:action=>"new", :controller=>"moves"}
#     edit_move GET    /moves/:id/edit(.:format)     {:action=>"edit", :controller=>"moves"}
#          move GET    /moves/:id(.:format)          {:action=>"show", :controller=>"moves"}
#               PUT    /moves/:id(.:format)          {:action=>"update", :controller=>"moves"}
#               DELETE /moves/:id(.:format)          {:action=>"destroy", :controller=>"moves"}
