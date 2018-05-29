require "rails_helper"

describe 'User' do
  describe 'visits dashboard' do
    scenario 'sees all tournaments they are a part of' do
      user1 = create(:user, token: ENV['strava_my_token'])
      tournament1 = create(:tournament)
      tournament2 = create(:tournament)
      create(:user_tournament, user: user1, tournament: tournament1)
      create(:user_tournament, user: user1, tournament: tournament2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      visit dashboard_path

      expect(page).to have_css('tr.tournament', count: 2)
      within(first('tr.tournament')) do
        expect(page).to have_content(tournament1.name)
      end
    end
  end
end
