require 'rails_helper'

feature 'Visitor views all trips' do
  describe 'as a visitor on the trips index page' do
    let!(:trip_1){Trip.create!(name: "Sun trip", start_date: "01/01/2010", end_date: "12/3/2012")}
    let!(:trip_2){Trip.create!(name: "Fun trip", start_date: "01/06/2010", end_date: "2/3/2012")}

    before do
      visit trips_path
    end

    scenario 'I view all trip names' do
      expect(current_path).to eq(trips_path)
      expect(page).to have_content(trip_1.name)
      expect(page).to have_content(trip_2.name)
    end
  end
end
