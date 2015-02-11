class FixProviderAndClientColumnName < ActiveRecord::Migration
  def change
    rename_column :clients, :firstname, :first_name
    rename_column :clients, :lastname, :last_name
    rename_column :providers, :firstname, :first_name
    rename_column :providers, :lastname, :last_name
  end
end
