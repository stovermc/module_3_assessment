require 'rails_helper'

describe "seach by zip" do
  it "returns stores in 25 mile radius" do
    zip = 80202
    visit '/'

    fill_in 'zip', with: zip

    click_on "search"

    expect(current_path).to eq '/search'

    within 'h2' do
      expect(page).to have_content "Stores within 25 miles"
    end

    expect(page).to have_content "16 Total Stores"
    expect(page).to have_content

    within first '.store' do
      expect(page).to have_content "BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER"
      expect(page).to have_content "DENVER"
      expect(page).to have_content "3.45"
      expect(page).to have_content "303-270-9189"
      expect(page).to have_content "Mobile SAS"
    end
  end
end
# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results
