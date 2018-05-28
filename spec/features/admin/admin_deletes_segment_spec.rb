require "rails_helper"

describe 'Admin' do
  scenario 'deletes a segment from segments index' do
    segment1 = create(:segment)
    segment2 = create(:segment)
    visit segments_path
    expect(page).to have_content(segment1.name)
    expect(page).to have_content(segment2.total_elevation_gain)
    expect(page).to have_content(segment1.athlete_attempts)

    within("#{segment1.name}") do
      click_on 'Delete'
    end

    expect(page).to_not have_content(segment1.name)
    expect(page).to have_content(segment2.total_elevation_gain)
    expect(page).to_not have_content(segment1.athlete_attempts)
  end
end
