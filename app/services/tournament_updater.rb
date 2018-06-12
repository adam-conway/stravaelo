class TournamentUpdater
  attr_reader :tournament

  def initialize(tournament)
    @tournament = tournament
  end

  def update
    tournament.users.each do |user|
      tournament.segments.each do |segment|
        user_pr = UserRankingQuery.new(user, segment).run
        perf_perc = (segment.kom_time / user_pr.to_f)
        perf_perc = 0 unless user_pr != 0
        UserSegment.where(segment_id: segment.id, user_id: user.id)
                   .first_or_create
                   .update(
                     pr: UserRankingQuery.new(user, segment).run,
                     perf_perc: perf_perc
                   )
      end
      UserTournament.where(user_id: user.id, tournament_id: tournament.id)
                    .first_or_create
                    .update(
                      total_perf_perc: user.user_segments
                                           .where(segment_id: tournament.segments.pluck(:id))
                                           .pluck(:perf_perc)
                                           .sum
                    )
    end
  end
end
