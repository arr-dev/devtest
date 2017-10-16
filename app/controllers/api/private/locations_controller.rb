class Api::Private::LocationsController < ApiController
  before_action :authenticate

  def show
    @locations = Location.by_country_code(params[:country_code])

    render @locations
  end
end
