require 'rails_helper'

describe "User Segment Updater" do
  context "Updates a user segment's" do
    it 'pr & performance percentage' do
      VCR.use_cassette('user segment updater') do
        user = create(:user, token: ENV['strava_my_token'])
        segment = create(:segment, id: 1470688)
        us = user.user_segments.create!(segment_id: segment.id, pr: 1, perf_perc: 0.01)

        UserSegmentUpdater.update(us)

        expect(us.pr).to eq(8218)
        expect(us.perf_perc).to eq(0.38403504502312)
      end
    end
  end
end
