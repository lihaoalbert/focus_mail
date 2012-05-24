class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.integer :member_id
      t.integer :campaign_id
      t.integer :link_id

      t.timestamps
    end
  end
end
