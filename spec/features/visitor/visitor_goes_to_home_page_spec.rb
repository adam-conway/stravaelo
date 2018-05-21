require 'rails_helper'

describe "Visitor" do
  describe "visits the home page" do
    scenario "Sees all expected titles and links on home page" do
      visit '/'
      # When I visit 'www.stravaelo.com'

      expect(current_path).to eq('/')
      expect(page).to have_content('straVaELO')
      expect(page).to have_css('.nav')
      within('.nav') do
        expect(page).to have_content('Log In')
      end

      expect(page).to have_link('Log in with Strava')
    end
  end
end
