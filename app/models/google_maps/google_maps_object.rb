module GoogleMaps
  class GoogleMapsObject
    alias :read_attribute_for_serialization :send

    attr_accessor :state_code
    attr_accessor :state_name
    attr_accessor :city
    attr_accessor :time_zone
    attr_accessor :country
  
    def initialize(params = {})
      self.state_code = params["results"].first["address_components"][2]["short_name"]
      self.state_name = params["results"].first["address_components"][2]["long_name"]
      self.city = params["results"].first["address_components"][1]["long_name"]
      self.time_zone = "NAN"
      self.country =  params["results"].first["address_components"][3]["long_name"]
    end

    def self.model_name
      @_model_name ||= ActiveModel::Name.new(self)
    end
  end
end
