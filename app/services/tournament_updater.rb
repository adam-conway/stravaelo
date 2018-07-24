class TournamentUpdater
  attr_reader :tournament

  def initialize(tournament)
    @tournament = tournament
  end

  def update
    tournament.users.each do |user|
      tournament.segments.each do |segment|
        user_segment = UserSegment
                        .where(segment_id: segment.id, user_id: user.id)
                        .first_or_create
        next unless user_segment.updated_at < 24.hours.ago || user_segment.pr.nil? || user_segment.perf_perc.nil?
        UserSegmentUpdater.update(user_segment)
        user_segment.update(updated_at: Time.now.utc)
      end
      user_tournament = UserTournament
                          .where(tournament_id: tournament.id, user_id: user.id)
                          .first_or_create
      next unless user_tournament.updated_at < 24.hours.ago || user_tournament.total_perf_perc.nil?
      UserTournamentUpdater.update(user_tournament)
      user_tournament.update(updated_at: Time.now.utc)
    end
    tournament.update(updated_at: Time.now.utc)
  end

end
