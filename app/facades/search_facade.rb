# require "./app/poros/station"

class SearchFacade
  def self.fuel_station_search(location)
    # # use the uri from postman to create Faraday setup:
    # # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=1331 17th St, Denver, CO 80214&fuel_type=ELEC&state=CO&limit=1&api_key=CMqG0jxYKd81yfsGtDIIZmWTFLmuXIdw0B2jGBtC
    # # do params in order they appear in uri
    # # the below to line 17 gets moved into a service.
    # conn = Faraday.new("https://developer.nrel.gov")
    # response = conn.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
    #   req.params["location"] = location
    #   req.params["fuel_type"] = "ELEC"
    #   req.params["limit"] = 1
    #   req.params["api_key"] = ENV["fuel_api_key"]
    # end
    # nrel_data = JSON.parse(response.body, symbolize_names: true)
    # # the below variable gets put to the Service.method(arguement) that is defined in the Service
    nrel_data = StationService.closest_altfuel_station(location)
    station_attr = nrel_data[:fuel_stations][0]

    # # use the uri from postman to create Faraday setup:
    # # http://open.mapquestapi.com/directions/v2/route?key=ht236ZTWGz8BcXTu5TxvZ4kzAyCOi8ge&from=39.750614,-104.996775&to=39.7502666,-104.9951694
    # # do params in order they appear in uri
    # conn = Faraday.new("http://open.mapquestapi.com")
    # response = conn.get("/directions/v2/route") do |req|
    #   req.params["key"] = ENV["map_api_key"]
    #   req.params["from"] = "#{nrel_data[:latitude]},#{nrel_data[:longitude]}"
    #   req.params["to"] = "#{station_attr[:latitude]},#{station_attr[:longitude]}"
    # end
    # mapquest_data = JSON.parse(response.body, symbolize_names: true)[:route]
    # # the below variable gets put to the Service.method(arguement) that is defined in the Service
    mapquest_data = MapService.driving_directions(
      nrel_data[:latitude],
      nrel_data[:longitude],
      station_attr[:latitude],
      station_attr[:longitude]
    )

    dirs = []
    mapquest_data[:legs][0][:maneuvers].each do |maneuver|
      dirs << maneuver[:narrative]
    end

    attr = {
      station_name: station_attr[:station_name],
      street_address: station_attr[:street_address],
      city: station_attr[:city],
      state: station_attr[:state],
      zip: station_attr[:zip],
      fuel_type: station_attr[:fuel_type_code],
      access_days_time: station_attr[:access_days_time],
      distance: mapquest_data[:distance],
      travel_time: mapquest_data[:time],
      directions: dirs
    }

    Station.new(attr)
  end
end
