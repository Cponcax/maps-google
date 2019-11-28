class GoogleMapsController < ApplicationController
   MAIN_ROUTE = 'https://maps.googleapis.com/maps/api/geocode/json?'

  def http_party 
    geo_code = '97703'
    result = HTTParty.get(MAIN_ROUTE + 'address=' + geo_code +'&key=' +  Rails.application.secrets.google_api).parsed_response
    response = sanitize(result)
    render json: response, status: 201
  end

  def sanitize(result)
    model = GoogleMaps::GoogleMapsObject.new(result)
    serializer = GoogleMapsSerializer.new(model)
    {
      data: serializer.object
    }
  end
end
