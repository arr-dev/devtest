require 'test_helper'

class Api::Private::EvaluateTargetsControllerTest < ActionController::TestCase
  test "should require authentication" do
    post :create, {}
    assert_response :unauthorized
  end
end
