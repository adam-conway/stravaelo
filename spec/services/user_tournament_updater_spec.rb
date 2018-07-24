require 'rails_helper'

describe "User Tournament Updater" do
  context "Updates a user total performance percentage score" do
    it 'when they have a time' do
      user = create(:user)
      tournament = create(:tournament)
      segment_list = create_list(:segment, 5)
      segment = create(:segment)
      segment_list.each do |segment|
        tournament.tournament_segments.create!(segment_id: segment.id)
        user.user_segments.create!(segment_id: segment.id, perf_perc: 1.0)
      end
      ut = user.user_tournaments.create!(tournament_id: tournament.id, total_perf_perc: 1.01)

      UserTournamentUpdater.update(ut)

      expect(ut.total_perf_perc).to eq(5)
    end
  end
end
