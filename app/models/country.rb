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
  has_many :locations, through: :location_groups
  has_and_belongs_to_many :target_groups, -> { root }

  validates :country_code, presence: true, uniqueness: true
  validates :panel_provider, presence: true

  before_validation :upcase_country_code

  scope :by_country_code, ->(code) { where(country_code: code.to_s.upcase) }

  private

  def upcase_country_code
    self.country_code = country_code.upcase if country_code?
  end
end
