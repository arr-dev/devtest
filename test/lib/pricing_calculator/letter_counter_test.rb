require "test_helper"
require "pricing_calculator/letter_counter"

class PricingCalculator::LetterCounterTest < ActiveSupport::TestCase
  test "it counts all letters in html document" do
    html = File.read(File.join(fixture_path, "ror_welcome.html"))

    calculator = PricingCalculator::LetterCounter.new(page: html, letter: "rR")

    assert_equal 17, calculator.call
  end
end
