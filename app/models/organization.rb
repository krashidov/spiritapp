# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime
#  updated_at :datetime
#

class Organization < ActiveRecord::Base
  has_paper_trail

  has_many :users, dependent: :destroy
  has_many :providers,     dependent: :destroy
  has_many :clients,       dependent: :destroy
  has_many :careplans,     dependent: :destroy
  has_many :default_tasks, dependent: :destroy

  validates :name, presence: true

end
