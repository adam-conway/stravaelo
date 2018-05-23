require "rails_helper"

describe 'Admin' do
  scenario 'adds a new segment to be tracked' do
    VCR.use_cassette("Adding segment") do
      visit new_segment_path
      expect(current_path).to eq('/segments/new')

      click_link 'Log In With Strava'
      expect(page).to have_link('Adam Conway')
    end
  end
end
