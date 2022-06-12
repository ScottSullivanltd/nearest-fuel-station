class SearchController < ApplicationController
  def index
    @station = SearchFacade.fuel_station_search(params[:location])
    # render json: StationSerializer.new(station)

    # # use the uri from postman to create Faraday setup:
    # # https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=1331 17th St, Denver, CO 80214&fuel_type=ELEC&state=CO&limit=1&api_key=CMqG0jxYKd81yfsGtDIIZmWTFLmuXIdw0B2jGBtC
    # # do params in order they appear in uri
    # conn = Faraday.new("https://developer.nrel.gov")
    # response = conn.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
    #   req.params["location"] = params[:location]
    #   req.params["fuel_type"] = "ELEC"
    #   req.params["limit"] = 1
    #   req.params["api_key"] = ENV["fuel_api_key"]
    # end
    # nrel_data = JSON.parse(response.body, symbolize_names: true)
    # @station = nrel_data[:fuel_stations][0]
    #
    # # use the uri from postman to create Faraday setup:
    # # http://open.mapquestapi.com/directions/v2/route?key=ht236ZTWGz8BcXTu5TxvZ4kzAyCOi8ge&from=39.750614,-104.996775&to=39.7502666,-104.9951694
    # # do params in order they appear in uri
    # conn = Faraday.new("http://open.mapquestapi.com")
    # response = conn.get("/directions/v2/route") do |req|
    #   req.params["key"] = ENV["map_api_key"]
    #   req.params["from"] = "#{nrel_data[:latitude]},#{nrel_data[:longitude]}"
    #   req.params["to"] = "#{@station[:latitude]},#{@station[:longitude]}"
    # end
    # mapquest_data = JSON.parse(response.body, symbolize_names: true)[:route]
    # dirs = []
    # mapquest_data[:legs][0][:maneuvers].each do |maneuver|
    #   dirs << maneuver[:narrative]
    # end
    # @directions = {
    #   distance: mapquest_data[:distance],
    #   travel_time: Time.at(mapquest_data[:time]).utc.strftime("%H:%M:%S"),
    #   directions: dirs
    # }
    #
    # # at this point everything passes.  Time to refactor into facades, services, poros!
  end
end
