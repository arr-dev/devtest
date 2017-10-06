# == Schema Information
#
# Table name: location_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  country_id        :integer
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class LocationGroup < ActiveRecord::Base
  belongs_to :country, inverse_of: :location_groups
  belongs_to :panel_provider, inverse_of: :location_groups
  has_and_belongs_to_many :locations

  validates :country, presence: true
  validates :panel_provider, presence: true
end
