require "nokogiri"

class HtmlEnumerator
  include Enumerable

  def initialize(page_content)
    @elements = parse(page_content)
  end

  def each(element = elements, &block)
    return enum_for(:each) unless block_given?

    block.call(element)

    element.children.each do |el|
      each(el, &block)
    end
  end

  private

  attr_reader :elements

  def parse(content)
    Nokogiri::HTML.parse(content) do |config|
      config.noblanks
    end
  end
end
