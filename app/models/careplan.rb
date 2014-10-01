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

class Careplan < ActiveRecord::Base
  has_paper_trail
  
  has_many :tasks, dependent: :destroy

  belongs_to :organization
  belongs_to :client
  belongs_to :provider

  validates :organization_id, presence: true
  validates :client_id, presence: true
  validates :provider_id, presence: true
  validates :start_date, presence: true
  validates :procedure_code, presence: true

end
