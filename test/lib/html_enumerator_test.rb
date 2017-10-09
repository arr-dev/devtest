require "test_helper"
require "html_enumerator"

class HtmlEnumeratorTest < ActiveSupport::TestCase
  test "it iterates all html elements" do
    html = File.read(File.join(fixture_path, "ror_welcome.html"))

    enum = HtmlEnumerator.new(html)

    assert_equal 54, enum.map { |el| el }.count
  end
end
