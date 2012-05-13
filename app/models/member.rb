class Member < ActiveRecord::Base
  attr_accessible :email, :list_id, :name
end
