class Member < ActiveRecord::Base
  attr_accessible :email, :list_id, :name
  belongs_to :list
  has_many :campaign_members

  def self.get_field_array
    # every element consist of "name", "label", "name" is column name, "label" is display name
    field_array = [["name","name"], ["email","email"]]
  end
end
