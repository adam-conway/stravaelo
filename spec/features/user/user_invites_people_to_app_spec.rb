require 'rails_helper'

describe 'User' do
  context 'Add a friend to tournament' do
    scenario 'who is part of stavelo already' do
      VCR.use_cassette("Invite-to-tournament") do
        user1 = create(:user, token: ENV['strava_my_token'])
        user2 = create(:user, email: "test@test.com", token: 567)
        tournament1 = create(:tournament)
        segment1 = create(:segment, id: 1470688)
        segment2 = create(:segment, id: 5816161)
        create(:user_tournament, user: user1, tournament: tournament1)
        create(:tournament_segment, tournament: tournament1, segment: segment1)
        create(:tournament_segment, tournament: tournament1, segment: segment2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit tournament_path(tournament1)

        fill_in :invite_email, with: "test@test.com"
        click_on "Invite to tournament"

        expect(ActionMailer::Base.deliveries.last).to eq(nil)
        expect(current_path).to eq(tournament_path(tournament1))
        expect(page).to have_content(user2.name)
      end
    end
    scenario 'who isnt part of stravelo' do
      VCR.use_cassette("Invite-to-stravelo") do
        user1 = create(:user, token: ENV['strava_my_token'])
        tournament1 = create(:tournament)
        segment1 = create(:segment, id: 1470688)
        segment2 = create(:segment, id: 5816161)
        create(:user_tournament, user: user1, tournament: tournament1)
        create(:tournament_segment, tournament: tournament1, segment: segment1)
        create(:tournament_segment, tournament: tournament1, segment: segment2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit tournament_path(tournament1)

        fill_in :invite_email, with: "test@test.com"
        click_on "Invite to tournament"

        email = ActionMailer::Base.deliveries.last

        expect(email.from).to eq(['no-reply@stravelo.com'])
        expect(email.to).to eq(['test@test.com'])
        expect(email.subject).to eq("#{user1.name} has challenged you to a Strava tournament!")
        expect(email.html_part.body.to_s).to have_content('Visit here to join Stravelo and compete')
      end
    end
  end
end