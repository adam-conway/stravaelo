require 'rails_helper'

describe 'User' do
  context 'Add a friend to tournament' do
    scenario 'who is part of stavelo already' do
      VCR.use_cassette("Invite-to-tournament") do
        user1 = create(:user, token: ENV['strava_my_token'])
        user2 = create(:user, email: "test@test.com")
        tournament1 = create(:tournament)
        segment1 = create(:segment, id: 1470688)
        segment2 = create(:segment, id: 5816161)
        create(:user_tournament, user: user1, tournament: tournament1)
        create(:tournament_segment, tournament: tournament1, segment: segment1)
        create(:tournament_segment, tournament: tournament1, segment: segment2)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
        visit tournament_path(tournament1)

        fill_in :invite, with: "test@test.com"
        click_on "Invite to tournament"

        expect(ActionMailer::Base.deliveries.last).to eq(nil)
        expect(current_path).to eq(tournament_path(tournament1))
        expect(page).to have_content(user2.name)
      end
      # VCR.use_cassette("Invite-to-tournament") do
      #   user1 = create(:user, token: ENV['strava_my_token'])
      #   tournament1 = create(:tournament)
      #   segment1 = create(:segment, id: 1470688)
      #   segment2 = create(:segment, id: 5816161)
      #   create(:user_tournament, user: user1, tournament: tournament1)
      #   create(:tournament_segment, tournament: tournament1, segment: segment1)
      #   create(:tournament_segment, tournament: tournament1, segment: segment2)
      #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)
      #   visit tournament_path(tournament1)
      #
      #   fill_in :invite, with: "adam.n.conway@gmail.com"
      #   click_on "Invite to tournament"
      #
      #   email = ActionMailer::Base.deliveries.last
      #
      #   expect(email.from).to eq(['no-reply@battleshift.com'])
      #   expect(email.to).to eq([user.email])
      #   expect(email.subject).to eq('Welcome to Battleshift!')
      #   expect(email.html_part.body.to_s).to have_content('Visit here to activate your account.')
      #   expect(email.html_part.body.to_s).to have_content('Visit here to activate your account.')
      #   expect(email.text_part.body.to_s).to have_content("Your API key: #{user.api_key}")
      #   expect(email.html_part.body.to_s).to have_content("Your API key: #{user.api_key}")
      # end
    end
  end
end
