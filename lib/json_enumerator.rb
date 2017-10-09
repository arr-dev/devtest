require "json"

class JsonEnumerator
  include Enumerable

  def initialize(page_content)
    @elements = parse(page_content)
  end

  def each(enum = elements, &block)
    return enum_for(:each) unless block_given?

    if enum.is_a?(Array)
      enum.each do |value|
        enumerate(value, &block)
      end
    end
    if enum.is_a?(Hash)
      enum.each do |key, value|
        enumerate(value, &block)
      end
    end
  end

  private

  attr_reader :elements

  def parse(content)
    JSON.parse(content)
  end

  def enumerate(enum, &block)
    if enum && enum.respond_to?(:each)

      block.call enum

      each(enum, &block)
    end
  end
end
