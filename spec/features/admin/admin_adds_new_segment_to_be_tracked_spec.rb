require "rails_helper"

describe 'Admin' do
  scenario 'adds a new segment to be tracked' do
    VCR.use_cassette("Adding-segment") do
      visit new_segment_path
      expect(current_path).to eq('/segments/new')

      fill_in 'segment[id]', with: 229781
      click_on "Add Segment"

      expect(current_path).to eq('/segments')
      expect(page).to have_content('Hawk Hill was successfully added')
    end
  end
end
