require "json_enumerator"

module PricingCalculator
  class ArrayElementsCounter
    def initialize(page:, size:)
      @page = page
      @size = size
    end

    def call
      nodes.count do |element|
        element.is_a?(Array) && element.size > size
      end
    end

    private

    attr_reader :page, :size

    def nodes
      @nodes ||= JsonEnumerator.new(page)
    end
  end
end
