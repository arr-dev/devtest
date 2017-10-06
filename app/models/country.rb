# == Schema Information
#
# Table name: countries
#
#  id                :integer          not null, primary key
#  country_code      :string
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Country < ActiveRecord::Base
  belongs_to :panel_provider, inverse_of: :countries
  has_many :location_groups, inverse_of: :country
  has_and_belongs_to_many :target_groups, -> { root }

  validates :country_code, presence: true, uniqueness: true
  validates :panel_provider, presence: true
end
