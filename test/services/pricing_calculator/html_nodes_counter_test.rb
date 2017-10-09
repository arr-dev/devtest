require "test_helper"

class PricingCalculator::HtmlNodesCounterTest < ActiveSupport::TestCase
  test "it counts all html nodes in html document" do
    html = File.read(File.join(fixture_path, "ror_welcome.html"))

    calculator = PricingCalculator::HtmlNodesCounter.new(page: html)

    assert_equal 24, calculator.call
  end
end
