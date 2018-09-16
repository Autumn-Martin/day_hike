require 'rails_helper'

feature 'Visitor views single trip' do
  describe 'as a visitor on the trips index page' do
    let!(:trip_1){Trip.create!(name: "Sun trip", start_date: "01/01/2010", end_date: "12/3/2012")}
    let!(:trip_2){Trip.create!(name: "Fun trip", start_date: "01/06/2010", end_date: "2/3/2012")}
    before do
      visit trips_path
    end

    context 'when I click on the name of a trip' do
      let!(:trail_1){trip_1.trails.create!(name: "scorching", address: "The Sun St.", length: 123)}
      let!(:trail_2){trip_1.trails.create!(name: "bad burn", address: "The Sun Road", length: 12)}
      before do
        click_on trip_1.name
      end
      scenario 'I view a single trip name' do
        expect(current_path).to eq(trip_path(trip_1))
        expect(page).to have_content(trip_1.name)
        expect(page).to_not have_content(trip_2.name)
      end
      scenario 'I view a list of trails for that trip' do
        expect(page).to have_content(trail_1.name)
        expect(page).to have_content(trail_1.address)
        expect(page).to have_content(trail_1.length)
        expect(page).to have_content(trail_2.name)
        expect(page).to have_content(trail_2.address)
        expect(page).to have_content(trail_2.length)
      end
    end
  end
end
