class Api::Private::TargetGroupsController < ApiController
  include TargetGroupsActions

  before_action :authenticate
end
