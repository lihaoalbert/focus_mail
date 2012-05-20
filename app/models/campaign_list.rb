class CampaignList < ActiveRecord::Base
  attr_accessible :campaign_id, :list_id
  belongs_to :campaign
  belongs_to :list
end
