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

require 'rails_helper'

RSpec.describe Task, :type => :model do
  it "should be valid" do
    task = FactoryGirl.create :task
    expect(task).to be_valid
  end

  describe "relationships" do
    it "should have an organization" do
      task = FactoryGirl.build(:task, organization: nil)
      expect(task).to be_invalid
    end

    it "should belong to a careplan" do
      task = FactoryGirl.build(:task, careplan: nil)
      expect(task).to be_invalid
    end

    it "should belong to a default_task" do
      task = FactoryGirl.build(:task, default_task: nil)
      expect(task).to be_invalid
    end
  end
end
