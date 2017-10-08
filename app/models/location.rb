# == Schema Information
#
# Table name: locations
#
#  id          :integer          not null, primary key
#  name        :string
#  external_id :string
#  secret_code :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Location < ActiveRecord::Base
  has_and_belongs_to_many :location_groups
  has_many :countries, through: :location_groups
  has_many :panel_provider_countries, through: :location_groups, source: :panel_provider_countries

  def self.by_country_code(code)
    joins(:panel_provider_countries).merge(Country.by_country_code(code))
  end
end
