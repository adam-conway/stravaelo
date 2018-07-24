require 'rails_helper'

describe "User Segment Updater" do
  context "Updates a user segment's pr & performance percentage" do
    it 'when they have a time' do
      VCR.use_cassette('existing user segment updater') do
        user = create(:user, token: ENV['strava_my_token'])
        segment1 = create(:segment, id: 1470688, kom_time: 3156)
        us1 = user.user_segments.create!(segment_id: segment1.id, pr: 1, perf_perc: 0.01)

        UserSegmentUpdater.update(us1)

        expect(us1.pr).to eq(8218)
        expect(us1.perf_perc).to eq(0.38403504502311997)
      end
    end

    it 'when they dont have a time' do
      VCR.use_cassette('user segment updater') do
        user = create(:user, token: ENV['strava_my_token'])
        segment2 = create(:segment, id: 2685055)
        us2 = user.user_segments.create!(segment_id: segment2.id, pr: 0, perf_perc: 0.0)

        UserSegmentUpdater.update(us2)

        expect(us2.pr).to eq(0)
        expect(us2.perf_perc).to eq(0)
      end
    end
  end
end
