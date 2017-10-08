require 'test_helper'

class Api::Private::EvaluateTargetsControllerTest < ActionController::TestCase
  test "should require authentication" do
    post :create, {}
    assert_response :unauthorized
  end

  test "should allow authenticated" do
    api_key = ApiKey.create_with_token!

    request.headers["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Token.encode_credentials(api_key.token)

    post :create, {}
    assert_response :unprocessable_entity
  end
end
