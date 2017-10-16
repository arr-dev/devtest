require "pricing_type"

class PriceEvaluator
  include ActiveModel::Model

  attr_accessor :country_code, :target_group_id, :locations
  attr_reader :price

  validates :country_code, :target_group_id, :locations, presence: true
  validate :validate_country_code
  validate :validate_target_group
  validate :validate_locations

  def call
    if valid?
      panel_provider = country.panel_provider

      calculator = PricingType.build(type: panel_provider.pricing_logic).new

      self.price = calculator.call
    end
  end

  def as_json(*)
    { price: price }
  end

  private

  def country
    @country ||= Country.by_country_code(country_code).take
  end

  def price=(value)
    @price = value
  end

  def validate_country_code
    return unless country_code

    errors.add(:country_code, :not_found) unless country
  end

  def validate_target_group
    return unless target_group_id

    target_group_found = TargetGroup.where(id: target_group_id).exists?
    errors.add(:target_group_id, :not_found) unless target_group_found
  end

  def validate_locations
    return unless locations

    validate_locations_format

    validate_locations_exist
  end

  def validate_locations_format
    valid_format = locations.all? { |l| l.key?(:id) && l.key?(:panel_size) }
    errors.add(:locations, :invalid) unless valid_format
  end

  def validate_locations_exist
    location_ids = locations.map {|l| l[:id] }.uniq
    found_locations = Location.where(id: location_ids).count

    errors.add(:locations, :not_found) unless location_ids.size == found_locations
  end
end
