class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      ApiKey.authenticate(token)
    end
  end

  def render_unauthorized
    self.headers["WWW-Authenticate"] = 'Token realm="Application"'

    render json: { error: "Access Denied" }, status: :unauthorized
  end
end
