require 'test_helper'

class Api::Private::TargetGroupsControllerTest < ActionController::TestCase
  test "should require authentication" do
    get :show, { country_code: "gb" }
    assert_response :unauthorized
  end

  test "should allow authenticated" do
    api_key = ApiKey.create_with_token!

    request.headers["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Token.encode_credentials(api_key.token)

    get :show, { country_code: "gb" }
    assert_response :success
  end
end
