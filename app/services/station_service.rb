class StationService < BaseService
  def self.closest_altfuel_station(location)
    # use the uri from postman to create Faraday setup:
    # http://open.mapquestapi.com/directions/v2/route?key=ht236ZTWGz8BcXTu5TxvZ4kzAyCOi8ge&from=39.750614,-104.996775&to=39.7502666,-104.9951694
    # do params in order they appear in uri
    response = conn("https://developer.nrel.gov").get("/api/alt-fuel-stations/v1/nearest.json") do |f|
      f.params["location"] = location
      f.params["fuel_type"] = "ELEC"
      f.params["limit"] = 1
      f.params["api_key"] = ENV["fuel_api_key"]
    end
    get_json(response)
  end
end
