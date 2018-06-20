require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'Field validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:user_tournaments) }
    it { should have_many(:users) }
    it { should have_many(:tournament_segments) }
    it { should have_many(:segments) }
  end

  describe 'queries' do
    it 'returns total tournament scores for users in ranked order' do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      tournament1 = create(:tournament)
      tournament2 = create(:tournament)
      ut1 = create(:user_tournament, tournament_id: tournament1.id, user_id: user1.id, total_perf_perc: 20.8790)
      ut2 = create(:user_tournament, tournament_id: tournament1.id, user_id: user2.id, total_perf_perc: 50.3452)
      ut3 = create(:user_tournament, tournament_id: tournament1.id, user_id: user3.id, total_perf_perc: 30.34564)
      ut4 = create(:user_tournament, tournament_id: tournament1.id, user_id: user4.id, total_perf_perc: 10.234523)
      ut5 = create(:user_tournament, tournament_id: tournament2.id, user_id: user4.id, total_perf_perc: 1000.234534)
      ranked_user_scores = tournament1.total_user_scores

      expect(ranked_user_scores.count).to eq(4)
      expect(ranked_user_scores[0]).to eq(ut2.total_perf_perc)
      expect(ranked_user_scores[1]).to eq(ut3.total_perf_perc)
      expect(ranked_user_scores[2]).to eq(ut1.total_perf_perc)
      expect(ranked_user_scores[3]).to eq(ut4.total_perf_perc)
    end
  end
end
