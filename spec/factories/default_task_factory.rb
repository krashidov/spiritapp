# == Schema Information
#
# Table name: default_tasks
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  name            :string(255)      not null
#  homemaking      :boolean          default(FALSE), not null
#  value           :integer          default(0), not null
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_default_tasks_on_organization_id  (organization_id)
#

require "date"

FactoryGirl.define do
  factory :default_task do
    organization
    name "Clean bathroom"
    homemaking true
    value 30
  end
end
