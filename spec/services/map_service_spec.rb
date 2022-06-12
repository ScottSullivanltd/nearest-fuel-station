require "rails_helper"

RSpec.describe MapService do
  describe "class methods" do
    it "driving_directions" do
      lat1 = 39.750614
      long1 = -104.996775
      lat2 = 39.7502666
      long2 = -104.9951694

      route = MapService.driving_directions(lat1, long1, lat2, long2)

      expect(route).to have_key(:distance)
      expect(route[:distance]).to be_a(Float)
      expect(route).to have_key(:time)
      expect(route[:time]).to be_a(Numeric) # Numeric is parent class for float and integer, Nemeric covers both

      expect(route).to have_key(:legs)
      expect(route[:legs]).to be_an(Array)

      first_leg = route[:legs][0]
      expect(first_leg).to have_key(:maneuvers)
      expect(first_leg[:maneuvers]).to be_an(Array)

      maneuvers = first_leg[:maneuvers]
      expect(maneuvers.length).to eq(2)

      expect(maneuvers[0]).to have_key(:narrative)
      expect(maneuvers[0][:narrative]).to be_a(String)
    end
  end
end
