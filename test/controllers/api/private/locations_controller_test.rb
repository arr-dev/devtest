require 'test_helper'

class Api::Private::LocationsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, { country_code: "gb" }
    assert_response :success
  end
end
