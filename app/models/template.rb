class Template < ActiveRecord::Base
  attr_accessible :file_name, :name
  has_many :entries
  has_many :campaigns
end
