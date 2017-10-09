require "html_enumerator"

module PricingCalculator
  class HtmlNodesCounter
    def initialize(page:)
      @page = page
    end

    def call
      nodes.count { |el| el.element? }
    end

    private

    attr_reader :page

    def nodes
      @nodes ||= HtmlEnumerator.new(page)
    end
  end
end
