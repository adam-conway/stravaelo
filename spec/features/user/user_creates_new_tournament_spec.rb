require "rails_helper"

describe 'User' do
  describe 'visits dashboard' do
    scenario 'sees a link to create a new tournament' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit dashboard_path

      expect(page).to have_link('Create a New Tournament')

      click_on 'Create a New Tournament'

      expect(current_path).to eq('/tournaments/new')
    end
  end
  describe 'visits new tournament page' do
    scenario 'and fills out form' do
      VCR.use_cassette("New-tournament") do
        user1 = create(:user, token: ENV['strava_my_token'])
        user2 = create(:user)
        segment1 = create(:segment, id: 229781)
        segment2 = create(:segment, id: 5816161)
        segment3 = create(:segment)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit new_tournament_path

        fill_in 'tournament[name]', with: 'New Tournament'
        check "tournament_segment_ids_#{segment1.id}"
        check "tournament_segment_ids_#{segment2.id}"
        click_on 'Create Tournament'

        tournament = Tournament.last

        expect(tournament.name).to eq('New Tournament')
        expect(tournament.segments.count).to eq(2)
        expect(tournament.segments.first).to eq(segment1)
        expect(tournament.segments.last).to eq(segment2)
        expect(tournament.users.count).to eq(1)
        expect(tournament.users.first).to eq(user1)
      end
    end
  end
end
