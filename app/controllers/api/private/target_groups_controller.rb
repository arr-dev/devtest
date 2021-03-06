class Api::Private::TargetGroupsController < ApiController
  before_action :authenticate

  def show
    @target_groups = TargetGroup.by_country_code(params[:country_code])

    render @target_groups
  end
end
