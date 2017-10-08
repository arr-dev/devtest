require 'test_helper'

class Api::Private::TargetGroupsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, { country_code: "gb" }
    assert_response :success
  end
end
