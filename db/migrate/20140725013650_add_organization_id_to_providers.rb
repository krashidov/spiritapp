class AddOrganizationIdToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :organization_id, :integer
    add_index  :providers, :organization_id
  end
end
