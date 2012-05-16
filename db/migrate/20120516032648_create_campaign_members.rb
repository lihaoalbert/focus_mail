class CreateCampaignMembers < ActiveRecord::Migration
  def change
    create_table :campaign_members do |t|
      t.integer :campaign_id
      t.string :member_id

      t.timestamps
    end
  end
end
