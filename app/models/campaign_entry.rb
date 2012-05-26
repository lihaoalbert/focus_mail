class CampaignEntry < ActiveRecord::Base
  attr_accessible :campaign_id, :entry_id, :value
  belongs_to :campaign
  belongs_to :entry
end
