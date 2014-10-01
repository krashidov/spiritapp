class InitializeProvider < ActiveRecord::Migration
  def change
    add_column :providers, :lastname, :string
    add_column :providers, :firstname, :string
    add_column :providers, :ssi, :string
    add_column :providers, :phone_number, :string
    add_column :providers, :address, :string
    add_column :providers, :city, :string
    add_column :providers, :state, :string
    add_column :providers, :postal_code, :string
    add_column :providers, :hours_plus_travel, :string
    add_column :providers, :date_of_birth, :date
    add_column :providers, :emergency_contact_info, :string
    add_column :providers, :units, :int, default: 0
    add_column :providers, :staff_evaluation_date, :date
    add_column :providers, :safety_training_date, :date
    add_column :providers, :supervisor, :string
    add_column :providers, :language, :string
    add_column :providers, :id_expiration_date, :date
    add_column :providers, :work_authorization_expiration, :date
    add_column :providers, :active, :boolean, default: true
  end
end
