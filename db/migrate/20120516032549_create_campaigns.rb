class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :from_name
      t.string :from_email
      t.string :subject
      t.integer :template_id

      t.timestamps
    end
  end
end
