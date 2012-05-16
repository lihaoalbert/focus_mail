class Email < ActiveRecord::Base
  attr_accessible :body, :template_entries, :template_id
end
