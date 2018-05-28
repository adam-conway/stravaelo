require "rails_helper"

describe 'Admin' do
  scenario 'adds a new segment to be tracked' do
    VCR.use_cassette("Adding-segment") do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit segments_path
      expect(current_path).to eq('/segments')

      fill_in 'segment[id]', with: 229781
      click_on "Add Segment"

      expect(current_path).to eq('/segments')
      expect(page).to have_content('Hawk Hill was successfully added')
    end
  end

  scenario 'Isnt able to add segment if its already in the DB' do
    VCR.use_cassette("Adding-segment") do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit segments_path
      expect(current_path).to eq('/segments')
      create(:segment, id: 229781)

      fill_in 'segment[id]', with: 229781
      click_on "Add Segment"

      expect(current_path).to eq('/segments')
      expect(page).to have_content('This segment has already been added')
    end
  end
end
