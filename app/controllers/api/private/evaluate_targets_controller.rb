require "price_evaluator"

class Api::Private::EvaluateTargetsController < ApiController
  before_action :authenticate

  def create
    evaluator = PriceEvaluator.new(create_params)

    if evaluator.call
       render json: evaluator, status: :ok
    else
      render json: evaluator.errors, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.permit(:country_code, :target_group_id, locations: [:id, :panel_size])
  end
end
