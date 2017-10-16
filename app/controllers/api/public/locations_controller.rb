class Api::Public::LocationsController < ApiController
  def show
    @locations = Location.by_country_code(params[:country_code])

    render @locations
  end
end
