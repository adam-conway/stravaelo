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

  # scenario 'they can log in and log out' do
  #   VCR.use_cassette("logging-out") do
  #     stub_omniauth
  #     visit root_path
  #     expect(page).to have_link('Log in with Strava')
  #     click_link 'Log in with Strava'
  #     click_link 'Logout'
  #     expect(page).to_not have_content('adam.n.conway@gmail.com')
  #   end
  # end

end
