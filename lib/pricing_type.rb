module PricingType
  ALL = %w(array_elements html_nodes letter)
  UndefinedType = Class.new(StandardError)

  def self.build(type:)
    raise UndefinedType, type.inspect unless ALL.include?(type)

    require "pricing_type/#{type}"

    PricingType.const_get(type.to_s.camelize)
  end
end
