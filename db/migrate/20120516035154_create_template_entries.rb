class CreateTemplateEntries < ActiveRecord::Migration
  def change
    create_table :template_entries do |t|
      t.integer :template_id
      t.string :type
      t.string :key
      t.string :default_value

      t.timestamps
    end
  end
end
