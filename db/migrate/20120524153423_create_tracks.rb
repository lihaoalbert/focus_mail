class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :member_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
