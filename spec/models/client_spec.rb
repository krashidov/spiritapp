# == Schema Information
#
# Table name: clients
#
#  id                     :integer          not null, primary key
#  created_at             :datetime
#  updated_at             :datetime
#  last_name              :string(255)
#  first_name             :string(255)
#  medicaid               :string(255)
#  ssi                    :string(255)
#  phone_number           :string(255)
#  address                :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  postal_code            :integer
#  case_manager           :string(255)
#  manager_phone          :string(255)
#  date_of_birth          :date
#  par_expiration         :date
#  emergency_contact_info :text
#  hours_plus_travel      :string(255)
#  units                  :integer          default(0)
#  last_home_visit        :date
#  languages              :string(255)
#  advanced_directive     :date
#  organization_id        :integer
#
# Indexes
#
#  index_clients_on_organization_id  (organization_id)
#

require 'rails_helper'

RSpec.describe Client, :type => :model do
  it "creates valid clients" do
    client = FactoryGirl.create :client
    expect(client).to be_valid
  end

  describe "invalid clients" do
    it "does not create clients that don't belong to an organization" do
      client = FactoryGirl.build(:client, organization: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a firstname" do
      client = FactoryGirl.build(:client, firstname: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a lastname" do
      client = FactoryGirl.build(:client, lastname: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a medicaid number" do
      client = FactoryGirl.build(:client, medicaid: nil)
      expect(client).to be_invalid
    end

    it "does not create clients with duplicate medicaid numbers" do
      first_client = FactoryGirl.create :client
      second_client = FactoryGirl.build :client

      expect(first_client).to be_valid
      expect(second_client).to be_invalid
    end

    it "does not create clients without a phone number" do
      client = FactoryGirl.build(:client, phone_number: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without an address" do
      client = FactoryGirl.build(:client, address: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a city" do
      client = FactoryGirl.build(:client, city: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a state" do
      client = FactoryGirl.build(:client, state: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a postal code" do
      client = FactoryGirl.build(:client, postal_code: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a date of birth" do
      client = FactoryGirl.build(:client, date_of_birth: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without a par expiration" do
      client = FactoryGirl.build(:client, par_expiration: nil)
      expect(client).to be_invalid
    end

    it "does not create clients without emergency contact information" do
      client = FactoryGirl.build(:client, emergency_contact_info: nil)
      expect(client).to be_invalid
    end
  end

  describe "relationships" do 
    it "should have an organization" do
      client = FactoryGirl.build(:client, organization: nil)
      expect(client).to be_invalid
    end
  end

  describe "careplans" do
    before(:each) do
      @client = FactoryGirl.create(:client)
      @careplan = FactoryGirl.create(:careplan, client: @client)
    end

    it "should be able to have valid careplans" do
      expect(@careplan.client).to eq(@client)
      expect(@client.careplans.first).to eq(@careplan)
    end

    it "should be deleted after client is deleted" do
      @client.destroy!
      expect(Careplan.exists?(@careplan)).to eq(false)
    end
  end
end
