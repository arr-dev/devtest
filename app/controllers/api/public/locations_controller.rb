class Api::Public::LocationsController < ApiController
  def show
    locations = Location.by_country_code(params[:country_code])

    render json: locations
  end
end
