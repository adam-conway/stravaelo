namespace :update do
  desc "Updates all user segment prs, perf_perc, and user tournament total_perf_percs"
  task strava_data: :environment do
    fifteen_min_requests = 0
    daily_requests = 0
    Tournament.all.each do |tournament|
      next unless tournament.updated_at < 24.hours.ago
      TournamentUpdater.new(tournament).update
    end
  end
end
