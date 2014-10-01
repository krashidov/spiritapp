# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Organization, :type => :model do
  it "creates valid organizations" do
    organization = FactoryGirl.create :organization
    expect(organization).to be_valid
  end

  describe "relationships" do
    it "should have users" do
      organization = FactoryGirl.create :organization
      user = FactoryGirl.create(:user, organization_id: organization.id)
      expect(organization.users.first).to eq(user)
      expect(user.organization).to eq(organization)
    end

    it "should have providers" do
      organization = FactoryGirl.create :organization

      provider1 = FactoryGirl.create(:provider, organization_id: organization.id)
      provider2 = FactoryGirl.create(:provider, organization_id: organization.id)
      provider3 = FactoryGirl.create(:provider, organization_id: organization.id)

      expect(organization.providers.first).to eq(provider1)
      expect(organization.providers.length).to eq(3)

      expect(provider1.organization).to eq(organization)
      expect(provider2.organization).to eq(organization)
      expect(provider3.organization).to eq(organization)
    end

    it "should have clients" do
      organization = FactoryGirl.create :organization
      client1 = FactoryGirl.create(:client, organization_id: organization.id)
      client2 = FactoryGirl.create(:client, medicaid: "test2", organization_id: organization.id)
      client3 = FactoryGirl.create(:client, medicaid: "test3", organization_id: organization.id)

      expect(organization.clients.first).to eq(client1)
      expect(organization.clients.length).to eq(3)

      expect(client1.organization).to eq(organization)
      expect(client2.organization).to eq(organization)
      expect(client3.organization).to eq(organization)
    end

    it "should have a user, a client and a provider" do
      organization = FactoryGirl.create :organization
      
      client   = FactoryGirl.create(:client, organization_id: organization.id)
      user     = FactoryGirl.create(:user, organization_id: organization.id)
      provider = FactoryGirl.create(:provider, organization_id: organization.id)

      expect(organization.clients.first).to  eq(client)
      expect(organization.users.first).to    eq(user)
      expect(organization.providers.first).to eq(provider)

      expect(client.organization).to eq(organization)
      expect(provider.organization).to eq(organization)
      expect(user.organization).to eq(organization)
    end

    it "and its objects should be deleted when an organization is deleted" do
      organization = FactoryGirl.create :organization
      client       = FactoryGirl.create(:client, organization_id: organization.id)
      user         = FactoryGirl.create(:user, organization_id: organization.id)
      provider     = FactoryGirl.create(:provider, organization_id: organization.id)
      careplan     = FactoryGirl.create(:careplan, organization: organization, provider: provider, client: client, relative_care: true)
      dt           = FactoryGirl.create(:default_task, organization: organization, name: "Cleaning Bathroom", value: 30, homemaking: true)
      task         = FactoryGirl.create(:task, organization: organization, careplan: careplan, default_task: dt, monday: true)

      organization.destroy!

      expect(Organization.exists?(organization)).to eq(false)
      expect(User.exists?(user)).to                 eq(false)
      expect(Client.exists?(client)).to             eq(false)
      expect(Provider.exists?(provider)).to         eq(false)
      expect(Careplan.exists?(careplan)).to         eq(false)
      expect(DefaultTask.exists?(dt)).to            eq(false)
      expect(Task.exists?(task)).to                 eq(false)

    end
  end
end
