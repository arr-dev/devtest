require "nokogiri"

class HtmlEnumerator
  include Enumerable

  def initialize(page_content)
    @elements = parse(page_content)
  end

  def each(element = elements, &block)
    return enum_for(:each) unless block_given?

    if element.children.empty?
      block.call(element)
    else
      element.children.each do |el|
        each(el, &block)
      end
    end
  end

  private

  attr_reader :elements

  def parse(content)
    Nokogiri::HTML.parse(content)
  end
end
