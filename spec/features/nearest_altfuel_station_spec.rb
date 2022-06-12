require "rails_helper"

# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
#
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
#
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"

RSpec.describe "Altfuel stations", type: :feature do
  it "successfully finds the nearest altfuel station to Turing" do
    visit root_path

    select "Turing", from: "location"
    click_button "Find Nearest Station"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Closest Station: CBRE As Agent for EQC Operating Trust")
    within(".address") do
      expect(page).to have_content("1225 17th Street, Suite 130, Denver, CO, 80202")
    end
    within(".fuel_type") do
      expect(page).to have_content("ELEC")
    end
    within(".access_times") do
      expect(page).to have_content("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
    end
  end

  it "successfully gives us driving directions" do
    visit root_path

    select "Turing", from: "location"
    click_button "Find Nearest Station"

    within(".distance") do
      expect(page).to have_content("0.088 miles")
    end
    within(".travel_time") do
      expect(page).to have_content("00:00:19")
    end
    within(".directions") do
      expect(page).to have_content("Start out going southeast on 17th St toward Larimer St. 1225 17TH STREET.")
    end
  end
end
