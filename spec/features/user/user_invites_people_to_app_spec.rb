require 'rails_helper'

describe 'User' do
  context 'Add a friend to tournament' do
    scenario 'who is part of stavelo already but not part of tournament' do
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
        expect(page).to_not have_content("That user is already part of this tournament!")
      end
    end
    scenario 'who is part of stavelo already and already part of tournament' do
      VCR.use_cassette("Already-part-of-tournament") do
        user1 = create(:user, token: ENV['strava_my_token'])
        tournament1 = create(:tournament)
        segment1 = create(:segment, id: 1470688)
        segment2 = create(:segment, id: 5816161)
        create(:user_tournament, user: user1, tournament: tournament1)
        create(:tournament_segment, tournament: tournament1, segment: segment1)
        create(:tournament_segment, tournament: tournament1, segment: segment2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit tournament_path(tournament1)

        fill_in :invite_email, with: user1.email
        click_on "Invite to tournament"

        expect(ActionMailer::Base.deliveries.last).to eq(nil)
        expect(current_path).to eq(tournament_path(tournament1))
        expect(page).to have_content("That user is already part of this tournament!")
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
        expect(email.html_part.body.to_s).to have_content('Visit here to login using Stava to join Stravelo and compete with friends')
      end
    end
  end
  context 'receives invitation email' do
    scenario 'joins stravelo from email' do
      VCR.use_cassette("joining-tournament") do
        stub_omniauth_alternate
        user1 = create(:user, token: ENV['strava_my_token'])
        tournament1 = create(:tournament)
        segment1 = create(:segment, id: 1470688)
        segment2 = create(:segment, id: 5816161)
        create(:user_tournament, user: user1, tournament: tournament1)
        create(:tournament_segment, tournament: tournament1, segment: segment1)
        create(:tournament_segment, tournament: tournament1, segment: segment2)
        user2 = create(:user, email: "adam.n.conway+testoauth@gmail.com", status: 1, token: nil, uid: nil)

        expect(user2.email).to eq('adam.n.conway+testoauth@gmail.com')
        expect(user2.status).to eq('pending')
        expect(user2.uid).to eq(nil)

        visit root_path

        click_on 'Log In With Strava'

        user2 = User.find(user2.id)

        expect(user2.email).to eq('adam.n.conway+testoauth@gmail.com')
        expect(user2.status).to eq('active')
        expect(user2.uid).to eq('31446019')
        expect(user2.token).to eq(ENV['strava_alternate_token'])
      end
    end
  end
end
