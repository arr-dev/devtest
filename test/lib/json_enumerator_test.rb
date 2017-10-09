require "test_helper"
require "json_enumerator"

class JsonEnumeratorTest < ActiveSupport::TestCase
  test "it iterates deep enum elements" do
    json = { a: Array.new(11), b: { a: [Array.new(5), Array.new(12)] } }.to_json

    enum = JsonEnumerator.new(json)
    assert_equal 4, enum.count { |e| e.is_a?(Array) }
  end
end
