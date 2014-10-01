class CreateCareplans < ActiveRecord::Migration
  def change
    create_table :careplans do |t|
      t.belongs_to :organization
      t.belongs_to :client
      t.belongs_to :provider
      t.boolean :relative_care, default: 0, null: false
      t.date    :start_date
      t.string  :procedure_code
      t.timestamps
    end

    add_index :careplans, :organization_id
    add_index :careplans, :client_id
    add_index :careplans, :provider_id
  end
end
