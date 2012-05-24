FocusMail::Application.routes.draw do

  resources :tracks

  resources :clicks

  resources :links

  resources :templates do
    resources :entries
  end

  resources :campaign_members

  resources :campaigns
  match 'campaigns/:id/deliver/', controller: 'campaigns', action: 'deliver', as: 'deliver_campaign'

  resources :lists do
    resources :members
  end

  root :to => 'home#index'
  match 'send_email' => 'home#send_email', via: 'post'
  match 'generate_email' => 'home#generate_email', via: 'get'
  mount Resque::Server, :at => '/resque'

  match 'members/imexport/:list_id' => 'members#imexport', :as => :members_imexport
  get 'members/export'
  get 'members/import_template'
  match 'members/import' => 'members#import', :via => :post

  match 'member_mailer/:action', :controller => "member_mailer", :as => :preview

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
  # match ':controller(/:action(/:id))(.:format)'
end
