class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :organization
      t.belongs_to :careplan
      t.belongs_to :default_task

      t.boolean :monday,    default: false, null: false
      t.boolean :tuesday,   default: false, null: false
      t.boolean :wednesday, default: false, null: false
      t.boolean :thursday,  default: false, null: false
      t.boolean :friday,    default: false, null: false
      t.boolean :saturday,  default: false, null: false
      t.boolean :sunday,    default: false, null: false

      t.timestamps
    end

    add_index :tasks, :organization_id
    add_index :tasks, :careplan_id
    add_index :tasks, :default_task_id

  end
end
