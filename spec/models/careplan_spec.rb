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

require 'rails_helper'

RSpec.describe Careplan, :type => :model do
  it "creates valid careplans" do
    careplan = FactoryGirl.create :careplan
    expect(careplan).to be_valid
  end

  describe "relationships" do
    it "should have an organization" do
      careplan = FactoryGirl.build(:careplan, organization: nil)
      expect(careplan).to be_invalid
    end

    it "should have a client" do
      careplan = FactoryGirl.build(:careplan, client: nil)
      expect(careplan).to be_invalid
    end

    it "should have a provider" do
      careplan = FactoryGirl.build(:careplan, provider: nil)
      expect(careplan).to be_invalid
    end

    it "can have tasks" do
      careplan = FactoryGirl.create :careplan
      task = FactoryGirl.create(:task, careplan: careplan)

      expect(task.careplan).to eq(careplan)
      expect(careplan.tasks.first).to eq(task)
    end
  end

  describe "attributes" do
    it "should have a date" do 
      careplan = FactoryGirl.build(:careplan, start_date: nil)
      expect(careplan).to be_invalid
    end

    it "should have a procedure_code" do 
      careplan = FactoryGirl.build(:careplan, procedure_code: nil)
      expect(careplan).to be_invalid
    end
  end

  describe "deletion" do
    it "should delete associations" do
      careplan = FactoryGirl.create(:careplan)
      task = FactoryGirl.create(:task, careplan: careplan)
      careplan.destroy!
      expect(Task.exists?(task)).to eq(false)
    end
  end
end

