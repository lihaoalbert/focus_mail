class CreateCampaignLists < ActiveRecord::Migration
  def change
    create_table :campaign_lists do |t|
      t.integer :campaign_id
      t.string :list_id

      t.timestamps
    end
  end
end
