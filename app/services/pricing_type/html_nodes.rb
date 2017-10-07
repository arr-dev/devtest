require "downloader"

module PricingType
  class HtmlNodes
    def call
      page = Downloader.new("http://time.com").body
      calculator = PricingCalculator::HtmlNodesCounter.new(page: page)
      calculator.call / 100
    end
  end
end

