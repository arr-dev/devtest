require "test_helper"

class PricingCalculator::ArrayElementsCounterTest < ActiveSupport::TestCase
  test "it counts array elements in json document" do
    json = { a: Array.new(11), b: { a: [Array.new(5), Array.new(12)] }, c: Array.new(3) }.to_json

    calculator = PricingCalculator::ArrayElementsCounter.new(page: json, size: 5)

    assert_equal 2, calculator.call
  end
end
