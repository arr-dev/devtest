require 'test_helper'

class Api::Private::EvaluateTargetsControllerTest < ActionController::TestCase
  test "should post create" do
    post :create, {}
    assert_response :success
  end
end
