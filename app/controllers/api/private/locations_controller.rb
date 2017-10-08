class Api::Private::LocationsController < ApiController
  include LocationsActions

  before_action :authenticate
end
