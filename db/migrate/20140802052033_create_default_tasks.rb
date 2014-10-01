class CreateDefaultTasks < ActiveRecord::Migration
  def change
    create_table :default_tasks do |t|
      t.belongs_to :organization
      t.string  :name, null: false
      t.boolean :homemaking, default: 0, null: false
      t.integer :value, default: 0, null: false

      t.timestamps
    end

    add_index :default_tasks, :organization_id
  end
end
