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

require "date"

FactoryGirl.define do
  factory :task do
    organization
    careplan
    default_task
    monday    false
    tuesday   false
    wednesday false
    thursday  false
    friday    false
    saturday  false
    sunday    false
  end
end
