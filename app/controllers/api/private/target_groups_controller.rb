class Api::Private::TargetGroupsController < ApiController
  def show
    target_groups = TargetGroup.by_country_code(params[:country_code])

    render json: target_groups
  end
end
