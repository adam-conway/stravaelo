require "rails_helper"

describe 'Visitor' do
  scenario 'logs in using Strava' do
    VCR.use_cassette("logging-in") do
      stub_omniauth
      visit root_path
      expect(page).to have_link('Log In With Strava')
      click_link 'Log In With Strava'
      expect(page).to have_link('Adam Conway')
    end
  end
  scenario 'they can log out' do
    # VCR.use_cassette("logging-out") do
      # stub_omniauth
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit root_path
      expect(page).to have_link(user.name)
      click_link user.name
      click_link 'Logout'
      expect(page).to_not have_content(user.name)
    # end
  end
end
