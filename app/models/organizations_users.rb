# == Schema Information
#
# Table name: organizations_users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class OrganizationsUsers < ActiveRecord::Base
  belongs_to :organization
  belongs_to :user
  
  validates :organization_id, presence: true
  validates :user_id, presence: true
end
