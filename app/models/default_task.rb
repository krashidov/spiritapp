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

class DefaultTask < ActiveRecord::Base
  resourcify
  has_paper_trail
  
  belongs_to :organization
  has_many   :tasks, dependent: :destroy

  validates :organization_id, presence: true
  validates :name, presence: true, length: {maximum: 100}
  validates :homemaking, presence: true
  validates :value, presence: true, numericality: { only_integer: true, 
                                                    less_than_or_equal_to: 1440 }
end
