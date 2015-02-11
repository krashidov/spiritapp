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

class Client < ActiveRecord::Base
  has_paper_trail
  
  belongs_to :organization
  has_many :careplans, dependent: :destroy

  validates :organization_id, presence: true
  validates_uniqueness_of :medicaid
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :medicaid, presence: true
  validates :ssi, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :postal_code, presence: true
  validates :case_manager, presence: true
  validates :manager_phone, presence: true
  validates :date_of_birth, presence: true
  validates :par_expiration, presence: true
  validates :emergency_contact_info, presence: true
end
