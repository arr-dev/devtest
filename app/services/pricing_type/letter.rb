require "downloader"

module PricingType
  class Letter
    def call
      page = Downloader.new("http://time.com").body
      calculator = PricingCalculator::LetterCounter.new(page: page, letter: "a")
      calculator.call / 100
    end
  end
end

