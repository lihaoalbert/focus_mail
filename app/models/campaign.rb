class Campaign < ActiveRecord::Base
  attr_accessible :email_id, :from_email, :from_name, :name, :subject
end
