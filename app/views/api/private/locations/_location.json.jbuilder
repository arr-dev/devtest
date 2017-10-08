json.partial! "api/public/locations/location", location: location

json.extract! location, :secret_code, :external_id
