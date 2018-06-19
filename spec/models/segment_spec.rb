require 'rails_helper'

RSpec.describe Segment, type: :model do
  describe 'Field validations' do
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
  end
end
