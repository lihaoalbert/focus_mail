class Track < ActiveRecord::Base
  attr_accessible :campaign_id, :member_id
  belongs_to :campaign
  belongs_to :member
end
