require 'rails_helper'

RSpec.describe Segment, type: :model do
  describe 'Field validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:distance) }
    it { should validate_presence_of(:average_grade) }
    it { should validate_presence_of(:maximum_grade) }
    it { should validate_presence_of(:elevation_high) }
    it { should validate_presence_of(:elevation_low) }
    it { should validate_presence_of(:total_elevation_gain) }
    it { should validate_presence_of(:athlete_attempts) }
    it { should validate_presence_of(:unique_athletes) }
    it { should validate_presence_of(:polyline) }
  end

  describe 'relationships' do
    it { should have_many(:user_segments) }
    it { should have_many(:users) }
    it { should have_many(:tournament_segments) }
    it { should have_many(:tournaments) }
  end

  describe 'Queries' do
    it 'Orders segments alphabetically' do
      segment1 = create(:segment, name: "AAAA")
      segment2 = create(:segment, name: "DDDD")
      segment3 = create(:segment, name: "CCCC")
      segment4 = create(:segment, name: "BBBB")

      ordered = Segment.alphabetical

      expect(ordered[0]).to eq(segment1)
      expect(ordered[1]).to eq(segment4)
      expect(ordered[2]).to eq(segment3)
      expect(ordered[3]).to eq(segment2)
    end

    it 'Returns all segments not in a list' do
      segment1 = create(:segment, name: "AAAA")
      segment2 = create(:segment, name: "DDDD")
      segment3 = create(:segment, name: "CCCC")
      segment4 = create(:segment, name: "BBBB")

      included_segments = Segment.where(id: [segment1.id, segment2.id, segment3.id])
      expect(Segment.excluded_segments(included_segments)).to eq([segment4])
    end

    it 'Returns all segment kom times in %H:%M:%S format' do
      segment_list = create_list(:segment, 5)
      segment_koms = Segment.kom_times

      segment_list.each do |segment|
        expect(segment_koms.include?(Time.at(segment.kom_time).utc.strftime("%H:%M:%S")))
      end
    end

    it 'Returns a single segments times and scores for all tournament users' do
      users = create_list(:user, 3)
      tournaments = create_list(:tournament, 2)
      tournaments[0].user_tournaments.create([{user_id: users[0].id, total_perf_perc: 0.40}, {user_id: users[1].id, total_perf_perc: 0.8}])
      tournaments[1].user_tournaments.create(user_id: users[2].id)
      segment1 = create(:segment, name: "DDDD")
      segment2 = create(:segment, name: "AAAA")
      users[0].user_segments.create([{ segment_id: segment1.id, pr: 100, perf_perc: 0.15 },
                                     { segment_id: segment2.id, pr: 200, perf_perc: 0.25 }])
      users[1].user_segments.create([{ segment_id: segment1.id, pr: 150, perf_perc: 0.35 },
                                     { segment_id: segment2.id, pr: 250, perf_perc: 0.45 }])
      users[2].user_segments.create([{ segment_id: segment1.id, pr: 300, perf_perc: 0.55 },
                                     { segment_id: segment2.id, pr: 350, perf_perc: 0.65 }])
      tournaments[0].tournament_segments.create([{segment_id: segment1.id}, {segment_id: segment2.id}])

      expected = segment1.pr_and_scores(tournaments[0])

      expect(expected.count).to eq(2)

      expect(expected[0].pr).to eq(150)
      expect(expected[0].perf_perc).to eq(0.35)

      expect(expected[1].pr).to eq(100)
      expect(expected[1].perf_perc).to eq(0.15)
    end
  end
end
