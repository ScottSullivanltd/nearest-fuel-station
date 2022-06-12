require "rails_helper"

RSpec.describe Station do
  it "creates a poro for altfuel station" do
    attr = {
      station_name: "abc inc",
      street_address: "123 main st",
      city: "denver",
      state: "co",
      zip: 80202,
      fuel_type: "ELEC",
      access_days_time: "Mon-Fri 24x7",
      distance: 23.4,
      travel_time: 3723,
      directions: [
        "step 1",
        "step 2"
      ]
    }
    station = Station.new(attr)

    expect(station.name).to eq("abc inc")
    expect(station.address).to eq("123 main st, denver, co, 80202")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("Mon-Fri 24x7")

    expect(station.distance).to eq("23.4 miles")
    expect(station.travel_time).to eq("01:02:03")
    expect(station.directions).to be_an(Array)
    expect(station.directions[0]).to eq("step 1")
    expect(station.directions[1]).to eq("step 2")
  end
end
