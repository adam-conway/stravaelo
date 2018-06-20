require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Field validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:user_tournaments) }
    it { should have_many(:tournaments) }
    it { should have_many(:user_segments) }
    it { should have_many(:segments) }
  end

  describe 'Queries' do
    it 'Returns a single users total score for a tournament' do
      user = create(:user)
      user_tournament1 = create(:user_tournament, user_id: user.id, total_perf_perc: 11.33222)
      user_tournament2 = create(:user_tournament, user_id: user.id, total_perf_perc: 50.00444)

      expect(user.total_tournament_score(user_tournament1.tournament)).to eq(11.33)
      expect(user.total_tournament_score(user_tournament2.tournament)).to eq(50.00)
    end

    it 'Ranks multiple users in a tournament' do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      tournament1 = create(:tournament)
      tournament2 = create(:tournament)
      create(:user_tournament, tournament_id: tournament1.id, user_id: user1.id, total_perf_perc: 20)
      create(:user_tournament, tournament_id: tournament1.id, user_id: user2.id, total_perf_perc: 50)
      create(:user_tournament, tournament_id: tournament1.id, user_id: user3.id, total_perf_perc: 30)
      create(:user_tournament, tournament_id: tournament1.id, user_id: user4.id, total_perf_perc: 10)
      create(:user_tournament, tournament_id: tournament2.id, user_id: user4.id, total_perf_perc: 1000)
      ranked_users = User.tournament_ranked(tournament1)

      expect(ranked_users[0]).to eq(user2)
      expect(ranked_users[1]).to eq(user3)
      expect(ranked_users[2]).to eq(user1)
      expect(ranked_users[3]).to eq(user4)
    end

    it 'Returns a single users times and scores for a tournament' do
      users = create_list(:user, 2)
      tournaments = create_list(:tournament, 2)
      tournaments[0].user_tournaments.create([{user_id: users[0].id}, {user_id: users[1].id}])
      tournaments[1].user_tournaments.create(user_id: users[0].id)
      segment1 = create(:segment, name: "AAAA")
      segment2 = create(:segment, name: "DDD")
      segment3 = create(:segment, name: "CCC")
      segment4 = create(:segment, name: "BBB")
      users[0].user_segments.create([{ segment_id: segment1.id, pr: 100, perf_perc: 0.15 },
                                     { segment_id: segment2.id, pr: 200, perf_perc: 0.25 },
                                     { segment_id: segment3.id, pr: 300, perf_perc: 0.35 },
                                     { segment_id: segment4.id, pr: 400, perf_perc: 0.45 }])
      users[1].user_segments.create(segment_id: segment1.id, pr: 10, perf_perc: 1.00)
      tournaments[0].tournament_segments.create([{segment_id: segment1.id}, {segment_id: segment2.id}, {segment_id: segment3.id}])

      expected = users[0].pr_and_scores(tournaments[0])

      expect(expected.count).to eq(3)

      expect(expected[0].pr).to eq(100)
      expect(expected[0].perf_perc).to eq(0.15)

      expect(expected[1].pr).to eq(300)
      expect(expected[1].perf_perc).to eq(0.35)

      expect(expected[2].pr).to eq(200)
      expect(expected[2].perf_perc).to eq(0.25)
    end
  end
end
