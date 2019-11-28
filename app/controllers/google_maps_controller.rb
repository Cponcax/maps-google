class GoogleMapsController < ApplicationController
   MAIN_ROUTE = 'https://maps.googleapis.com/maps/api/geocode/json?'

  def http_party 
    result = HTTParty.get(MAIN_ROUTE + 'address=97703&key=AIzaSyAu031skKaQ0Y1XTm5kILs7Uemoud5XAaw').parsed_response
    response = sanitize(result)
    render json: response
  end

  def sanitize(result)
    model = GoogleMaps::GoogleMapsObject.new(result)
    serializer = GoogleMapsSerializer.new(model)
    {
      data: serializer.object
    }
  end
end
