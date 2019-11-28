class GoogleMapsSerializer < ActiveModel::Serializer
  attributes  :state_code, :state_name, :city, :country

end
