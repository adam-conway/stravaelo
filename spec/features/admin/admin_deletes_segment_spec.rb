require "rails_helper"

describe 'Admin' do
  scenario 'deletes a segment from segments index' do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    segment1 = create(:segment)
    segment2 = create(:segment, name: "adam", athlete_attempts: 1)
    visit segments_path
    expect(page).to have_content(segment1.name)
    expect(page).to have_content(segment2.total_elevation_gain)
    expect(page).to have_content(segment1.athlete_attempts)

    within("tr.segment-#{segment1.id}") do
      click_on 'Delete'
    end

    expect(page).to_not have_content(segment1.name)
    expect(page).to have_content(segment2.total_elevation_gain)
    expect(page).to_not have_content(segment1.athlete_attempts)
  end
end
