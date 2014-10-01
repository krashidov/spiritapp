# == Schema Information
#
# Table name: tasks
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  careplan_id     :integer
#  default_task_id :integer
#  monday          :boolean          default(FALSE), not null
#  tuesday         :boolean          default(FALSE), not null
#  wednesday       :boolean          default(FALSE), not null
#  thursday        :boolean          default(FALSE), not null
#  friday          :boolean          default(FALSE), not null
#  saturday        :boolean          default(FALSE), not null
#  sunday          :boolean          default(FALSE), not null
#  created_at      :datetime
#  updated_at      :datetime
#
# Indexes
#
#  index_tasks_on_careplan_id      (careplan_id)
#  index_tasks_on_default_task_id  (default_task_id)
#  index_tasks_on_organization_id  (organization_id)
#

class Task < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :organization
  belongs_to :careplan
  belongs_to :default_task

  validates :organization_id, presence: true
  validates :careplan_id, presence: true
  validates :default_task_id, presence: true

end
