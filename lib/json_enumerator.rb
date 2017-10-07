require "json"

class JsonEnumerator
  include Enumerable

  def initialize(page_content)
    @elements = parse(page_content)
  end

  def each(enum = elements, &block)
    return enum_for(:each) unless block_given?

    enum.each do |key, value|
      value = key if value.nil?

      if value && value.respond_to?(:each)

        block.call value

        each(value, &block)
      end
    end
  end

  private

  attr_reader :elements

  def parse(content)
    JSON.parse(content)
  end
end
