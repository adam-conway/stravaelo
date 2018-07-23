require 'rails_helper'

describe "Tournament segments API" do
  it "sends a list of foods" do
    tournament = create(:tournament)
    segment1 = create(:segment)
    segment2 = create(:segment)
    segment3 = create(:segment)
    tournament.tournament_segments.create([{segment_id: segment1.id}, {segment_id: segment2.id}])

    get "/api/v1/tournaments/#{tournament.id}/segments?user_id=null"
    expect(response.successful?)
    segments = JSON.parse(response.body)

    expect(segments.count).to eq(2)
  end
end
