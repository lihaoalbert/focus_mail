FocusMail::Application.routes.draw do
  root :to => 'home#index'

  match 'track.gif' => 'home#track'
  match 'click' => 'home#click'
  match 'send_email' => 'home#send_email', via: 'post'
  match 'generate_email' => 'home#generate_email', via: 'get'
  match 'preview/:campaign_id' => "home#preview", :as => :preview

  resources :tracks
  resources :clicks
  resources :links
  resources :campaigns
  resources :campaign_members
  resources :templates do
    resources :entries
  end
  resources :lists do
    resources :members
  end

  match 'campaigns/template_entries/:c_id/:t_id' => 'campaigns#template_entries'
  match 'campaigns/:id/deliver/', controller: 'campaigns', action: 'deliver', as: 'deliver_campaign'

  match 'members/export/:list_id' => 'members#export', :as => :members_export
  get   'members/import_template'
  match 'members/imexport/:list_id' => 'members#imexport', :as => :members_imexport
  match 'members/import' => 'members#import', :via => :post

  mount Resque::Server, :at => '/resque'
end
