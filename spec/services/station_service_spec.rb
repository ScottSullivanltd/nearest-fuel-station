require "rails_helper"

RSpec.describe StationService do
  describe "class methods" do
    it "closest_altfuel_station" do
      location = "1331 17th St LL100, Denver, CO 80202"

      result = StationService.closest_altfuel_station(location)

      expect(result).to have_key(:latitude)
      expect(result).to have_key(:longitude)
      expect(result[:fuel_stations]).to be_an(Array)

      first_station = result[:fuel_stations][0]
      expect(first_station).to have_key(:station_name)
      expect(first_station[:station_name]).to be_a(String)
      expect(first_station).to have_key(:street_address)
      expect(first_station[:street_address]).to be_a(String)
      expect(first_station).to have_key(:city)
      expect(first_station[:city]).to be_a(String)
      expect(first_station).to have_key(:state)
      expect(first_station[:state]).to be_a(String)
      expect(first_station).to have_key(:zip)
      expect(first_station[:zip]).to be_a(String)
      expect(first_station).to have_key(:latitude)
      expect(first_station[:latitude]).to be_a(Float)
      expect(first_station).to have_key(:longitude)
      expect(first_station[:longitude]).to be_a(Float)
    end
  end
end
