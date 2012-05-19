class Campaign < ActiveRecord::Base
  attr_accessible :email_id, :from_email, :from_name, :name, :subject, :list_id, :member_ids, :template_id

  attr_accessor :list_id

  has_many :campaign_members
  has_many :members, :through => :campaign_members, uniq: true
  belongs_to :template

  validates_presence_of :name
end
