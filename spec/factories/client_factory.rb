# == Schema Information
#
# Table name: clients
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  lastname               :string(255)
#  firstname              :string(255)
#  medicaid               :string(255)
#  ssi                    :string(255)
#  phone_number           :string(255)
#  address                :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  postal_code            :integer
#  case_manager           :string(255)
#  manager_phone          :string(255)
#  date_of_birth          :date
#  par_expiration         :date
#  emergency_contact_info :text
#  hours_plus_travel      :string(255)
#  units                  :integer          default(0)
#  last_home_visit        :date
#  languages              :string(255)
#  advanced_directive     :date
#  organization_id        :integer
#
# Indexes
#
#  index_clients_on_organization_id  (organization_id)
#
require "date"

FactoryGirl.define do
  factory :client do
    organization
    lastname "Johnson"
    firstname "Dave"
    medicaid "Y#{Random.rand(10**6)}"
    ssi "650-00-000"
    phone_number "3032612082"
    address "123 fixture st."
    city "Fake"
    state  "CO"
    postal_code "80013"
    case_manager "Dillon Robertson"
    manager_phone "3032612082"
    date_of_birth Date.new(1930,01,30)
    par_expiration Date.new(2014,04,14)
    emergency_contact_info "Bill Johnson, Son 303-222-2222"
    hours_plus_travel "37 hours/month"
    units 0
    last_home_visit Date.new(2013,03,13)
    languages "English"
  end
end
