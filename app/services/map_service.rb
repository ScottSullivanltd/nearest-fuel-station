class MapService < BaseService
  def self.driving_directions(lat1, long1, lat2, long2)
    # use the uri from postman to create Faraday setup:
    # http://open.mapquestapi.com/directions/v2/route?key=ht236ZTWGz8BcXTu5TxvZ4kzAyCOi8ge&from=39.750614,-104.996775&to=39.7502666,-104.9951694
    # do params in order they appear in uri
    response = conn("http://open.mapquestapi.com").get("/directions/v2/route") do |f|
      f.params["key"] = ENV["map_api_key"]
      f.params["from"] = "#{lat1},#{long1}"
      f.params["to"] = "#{lat2},#{long2}"
    end
    get_json(response)[:route]
  end
end
