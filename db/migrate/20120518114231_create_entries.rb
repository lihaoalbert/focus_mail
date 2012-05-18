class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :template_id
      t.string :name
      t.string :default_value

      t.timestamps
    end
  end
end
