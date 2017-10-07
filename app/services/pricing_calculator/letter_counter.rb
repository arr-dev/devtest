require "html_enumerator"

module PricingCalculator
  class LetterCounter
    def initialize(page:, letter:)
      @page = page
      @letter = letter.chr
    end

    def call
      nodes.inject(0) do |sum, element|
        if element.text?
          sum += element.text.count(letter)
        else
          sum
        end
      end
    end

    private

    attr_reader :page, :letter, :count

    def nodes
      @nodes ||= HtmlEnumerator.new(page)
    end
  end
end
