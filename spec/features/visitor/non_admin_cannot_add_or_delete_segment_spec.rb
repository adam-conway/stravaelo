require "rails_helper"

describe 'User' do
  scenario 'cant add a new segment' do
    visit segments_path
    expect(page).to_not have_selector('input')
  end
end
