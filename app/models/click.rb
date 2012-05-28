class Click < ActiveRecord::Base
  attr_accessible :campaign_id, :link_id, :member_id
  belongs_to :campaign
  belongs_to :link
  belongs_to :member
end
