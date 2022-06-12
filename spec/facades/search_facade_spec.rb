require "rails_helper"

RSpec.describe SearchFacade do
  describe "class methods" do
    it ".fuel_station_search" do
      location = "1331 17th St LL100, Denver, CO 80202"
      result = SearchFacade.fuel_station_search(location)

      expect(result).to be_a(Station)
      expect(result.name).to eq("CBRE As Agent for EQC Operating Trust")
      expect(result.address).to eq("1225 17th Street, Suite 130, Denver, CO, 80202")
      expect(result.fuel_type).to eq("ELEC")
      expect(result.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")

      expect(result.distance).to eq("0.088 miles")
      expect(result.travel_time).to eq("00:00:19")
      expect(result.directions).to be_an(Array)
      expect(result.directions[0]).to eq("Start out going southeast on 17th St toward Larimer St.")
      expect(result.directions[1]).to eq("1225 17TH STREET.")
    end
  end
end
