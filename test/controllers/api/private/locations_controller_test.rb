require 'test_helper'

class Api::Private::LocationsControllerTest < ActionController::TestCase
  test "should require authentication" do
    get :show, { country_code: "gb" }
    assert_response :unauthorized
  end
end
