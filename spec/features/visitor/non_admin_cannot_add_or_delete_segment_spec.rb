require "rails_helper"

describe 'User' do
  scenario 'cant add a new segment' do
    visit segments_path
    expect(page).to_not have_selector('input')
  end

  scenario 'cant add a new segment' do
    segment = create(:segment)
    visit segments_path
    expect(page).to have_content(segment.name)

    within("tr.segment-#{segment.id}") do
      expect(page).to_not have_link('Delete')
    end

    expect(page).to have_content(segment.name)
  end
end
