class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :body
      t.integer :template_id
      t.text :template_entries

      t.timestamps
    end
  end
end
