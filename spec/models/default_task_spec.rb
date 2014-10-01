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

require 'rails_helper'

RSpec.describe DefaultTask, :type => :model do
  before(:each) do
    @default_task = FactoryGirl.build(:default_task)
  end

  it "should be valid" do
    default_task = FactoryGirl.create :default_task
    expect(default_task).to be_valid
  end

  describe "organization" do
    it "is required" do
      @default_task.organization = nil
      expect(@default_task).to be_invalid
    end
  end

  describe "tasks" do
    it "should delete after deleting a default task" do 
      @default_task.save!
      task = FactoryGirl.create(:task, default_task: @default_task)      
      @default_task.destroy!

      expect(Task.exists?(task)).to eq(false)
    end
  end

  describe "attributes" do
    it "should have a name" do
      @default_task.name = nil
      expect(@default_task).to be_invalid
    end

    it "should have a valid name length" do
      @default_task.name = "A" * 101
      expect(@default_task).to be_invalid
    end

    it "should have a value" do
      @default_task.value = nil
      expect(@default_task).to be_invalid
    end

    it "should have a value that isn't more than 1440 (this is the total minutes in a day)" do
      @default_task.value = 1441
      expect(@default_task).to be_invalid
    end
  end
end