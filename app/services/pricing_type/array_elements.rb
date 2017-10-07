require "downloader"

module PricingType
  class ArrayElements
    def call
      page = Downloader.new("http://openlibrary.org/search.json?q=the+lord+of+the+rings").body
      calculator = PricingCalculator::ArrayElementsCounter.new(page: page, size: 10)
      calculator.call
    end
  end
end
