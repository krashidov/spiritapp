# == Schema Information
#
# Table name: providers
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  last_name                     :string(255)
#  first_name                    :string(255)
#  ssi                           :string(255)
#  phone_number                  :string(255)
#  address                       :string(255)
#  city                          :string(255)
#  state                         :string(255)
#  postal_code                   :string(255)
#  hours_plus_travel             :string(255)
#  date_of_birth                 :date
#  emergency_contact_info        :string(255)
#  units                         :integer          default(0)
#  staff_evaluation_date         :date
#  safety_training_date          :date
#  supervisor                    :string(255)
#  language                      :string(255)
#  id_expiration_date            :date
#  work_authorization_expiration :date
#  active                        :boolean          default(TRUE)
#  organization_id               :integer
#
# Indexes
#
#  index_providers_on_organization_id  (organization_id)
#

require "date"

FactoryGirl.define do
  factory :provider do
    organization
    last_name "Patterson"
    first_name "Peter"
    ssi "650-01-001"
    phone_number "3036665555"
    address "456 caretaker way"
    city "Fake"
    state  "CO"
    postal_code "80013"
    staff_evaluation_date Date.new(2014,04,14)
    safety_training_date Date.new(2013,03,10)
    emergency_contact_info "Donna Richardson, Mother 303-444-5555"
    hours_plus_travel "37 hours/month"
    work_authorization_expiration Date.new(2013,03,13)
    id_expiration_date Date.new(2016,03,13)
    active true
  end
end
