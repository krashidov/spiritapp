# == Schema Information
#
# Table name: careplans
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  client_id       :integer
#  provider_id     :integer
#  relative_care   :boolean          default(FALSE), not null
#  start_date      :date
#  procedure_code  :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_careplans_on_client_id        (client_id)
#  index_careplans_on_organization_id  (organization_id)
#  index_careplans_on_provider_id      (provider_id)
#

require "date"

FactoryGirl.define do
  factory :careplan do
    organization
    client
    provider    
    relative_care false
    start_date Date.new(2013,03,13)
    procedure_code "UH5757"
  end
end
