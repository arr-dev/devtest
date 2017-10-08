module LocationsActions
  extend ActiveSupport::Concern

  def show
    @locations = Location.by_country_code(params[:country_code])

    render @locations
  end
end
