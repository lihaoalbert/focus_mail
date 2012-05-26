class CreateCampaignEntries < ActiveRecord::Migration
  def change
    create_table :campaign_entries do |t|
      t.integer :campaign_id
      t.integer :entry_id
      t.string :value

      t.timestamps
    end
  end
end
