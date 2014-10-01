class InitializeClient < ActiveRecord::Migration
  def change
    add_column :clients, :lastname, :string
    add_column :clients, :firstname, :string
    add_column :clients, :medicaid, :string
    add_column :clients, :ssi, :string
    add_column :clients, :phone_number, :string
    add_column :clients, :address, :string
    add_column :clients, :city, :string
    add_column :clients, :state, :string
    add_column :clients, :postal_code, :integer
    add_column :clients, :case_manager, :string
    add_column :clients, :manager_phone, :string
    add_column :clients, :date_of_birth, :date
    add_column :clients, :par_expiration, :date
    add_column :clients, :emergency_contact_info, :text
    add_column :clients, :hours_plus_travel, :string
    add_column :clients, :units, :integer, default: 0
    add_column :clients, :last_home_visit, :date
    add_column :clients, :languages, :string
    add_column :clients, :advanced_directive, :date
  end
end
