module PricingType
  ALL = %w(array_elements html_nodes letter)
  UndefinedType = Class.new(StandardError)

  def self.build(type:)
    type = type.to_s

    raise UndefinedType, type unless ALL.include?(type)

    PricingType.const_get(type.to_s.camelize)
  end
end
