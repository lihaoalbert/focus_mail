class Campaign < ActiveRecord::Base
  attr_accessible :email_id, :from_email, :from_name, :name, :subject, :list_ids, :template_id

  has_many :campaign_lists
  has_many :lists, :through => :campaign_lists, uniq: true
  belongs_to :template

  validates_presence_of :name, :template_id
end
