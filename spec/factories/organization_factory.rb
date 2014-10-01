# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

require "date"

FactoryGirl.define do
  factory :organization do
    name "Colorado Home Care"
  end
end
