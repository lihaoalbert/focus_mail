FocusMail::Application.routes.draw do

  match 'track.gif' => 'home#track'

  resources :tracks

  resources :clicks

  resources :links

  resources :templates do
    resources :entries
  end

  resources :campaign_members

  match 'click' => 'home#click'

  match 'campaigns/template_entries/:c_id/:t_id' => 'campaigns#template_entries'
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

  match 'member_mailer/preview/:campaign_id', :controller => "member_mailer", :action => "preview", :as => :preview

  # the priority is based upon order of creation:
  # first created -> highest priority.

  # sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # keep in mind you can assign values other than :controller and :action

  # sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # this route can be invoked with purchase_url(:id => product.id)

  # sample resource route (maps http verbs to controller actions automatically):
  #   resources :products

  # sample resource route with options:
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

  # sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # sample resource route within a namespace:
  #   namespace :admin do
  #     # directs /admin/products/* to admin::productscontroller
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # you can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # see how all your routes lay out with "rake routes"

  # this is a legacy wild controller route that's not recommended for restful applications.
  # note: this route will make all actions in every controller accessible via get requests.
  # match ':controller(/:action(/:id))(.:format)'
end
