# == Schema Information
#
# Table name: providers
#
#  id                            :integer          not null, primary key
#  created_at                    :datetime
#  updated_at                    :datetime
#  lastname                      :string(255)
#  firstname                     :string(255)
#  ssi                           :string(255)
#  phone_number                  :string(255)
#  address                       :string(255)
#  city                          :string(255)
#  state                         :string(255)
#  postal_code                   :string(255)
#  hours_plus_travel             :string(255)
#  date_of_birth                 :date
#  emergency_contact_info        :string(255)
#  units                         :integer          default(0)
#  staff_evaluation_date         :date
#  safety_training_date          :date
#  supervisor                    :string(255)
#  language                      :string(255)
#  id_expiration_date            :date
#  work_authorization_expiration :date
#  active                        :boolean          default(TRUE)
#  organization_id               :integer
#
# Indexes
#
#  index_providers_on_organization_id  (organization_id)
#

require 'rails_helper'

RSpec.describe Provider, :type => :model do
  before(:each) do
    @provider = FactoryGirl.build :provider
  end

  it "creates valid providers" do
    expect(@provider).to be_valid
  end

  describe "with invalid data" do
    it "does not create providers without a firstname" do
      @provider.firstname = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a lastname" do
      @provider.lastname = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a social security number" do
      @provider.ssi = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a phone number" do
      @provider.phone_number = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without an address" do
      @provider.address = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a city" do
      @provider.city = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a state" do
      @provider.state = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a postal code" do
      @provider.postal_code = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a staff evaluation date" do
      @provider.staff_evaluation_date = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without a safety training date" do
      @provider.safety_training_date = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without an id expiration date" do
      @provider.id_expiration_date = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without emergency contact information" do
      @provider.emergency_contact_info = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without work authorization expiration" do
      @provider.work_authorization_expiration = nil
      expect(@provider).to be_invalid
    end

    it "does not create providers without active status" do
      @provider.active = nil
      expect(@provider).to be_invalid
    end
  end

  describe "relationships" do
    it "should belong to an organization" do
      @provider.organization = nil
      expect(@provider).to be_invalid
    end
  end

  describe "careplans" do
    it "should be able to have valid careplans" do
      @provider.save!
      careplan = FactoryGirl.create(:careplan, provider: @provider)

      expect(careplan.provider).to eq(@provider)
      expect(@provider.careplans.first).to eq(careplan)
    end

    it "should be deleted after a provider is deleted" do
      @provider.save!
      careplan = FactoryGirl.create(:careplan, provider: @provider)
      @provider.destroy!

      expect(Careplan.exists?(careplan)).to eq(false)
    end
  end
end
