namespace :update do
  desc "Updates all user segment prs, perf_perc, and user tournament total_perf_percs"
  task strava_data: :environment do
    fifteen_min_requests = 0
    daily_requests = 0
    User.connection
    Segment.connection
    User.all.each do |user|
      user.segments_in_tournaments
      # Segment.all.each do |segment|
      #   user_segment = UserSegment
      #                   .where(segment_id: segment.id, user_id: user.id)
      #                   .first_or_create
      #   UserSegmentUpdater(user_segment).update
      # end
    end
  end

end
