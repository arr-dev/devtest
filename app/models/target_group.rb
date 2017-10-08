# == Schema Information
#
# Table name: target_groups
#
#  id                :integer          not null, primary key
#  name              :string
#  external_id       :string
#  parent_id         :integer
#  secret_code       :string
#  panel_provider_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class TargetGroup < ActiveRecord::Base
  belongs_to :panel_provider, inverse_of: :target_groups
  belongs_to :parent, class_name: "TargetGroup"
  has_many :children, foreign_key: :parent_id, class_name: "TargetGroup"
  has_many :panel_provider_countries, through: :panel_provider, source: :countries
  has_and_belongs_to_many :countries

  validates :panel_provider, presence: true

  scope :root, -> { where(parent_id: nil) }

  def self.by_country_code(code)
    joins(:panel_provider_countries).merge(Country.by_country_code(code))
  end
end
