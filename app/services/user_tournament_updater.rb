class UserTournamentUpdater
  def initialize(user_tournament)
    @user_tournament = user_tournament
    @user = user_tournament.user
    @tournament = user_tournament.tournament
  end

  def self.update(user_tournament)
    new(user_tournament).update
  end

  def update
    @user_tournament.update(total_perf_perc: total_performance_percentage)
  end

  private

    def total_performance_percentage
      segments = @tournament.segments
      UserSegment
        .where(user_id: @user.id, segment_id: segments)
        .pluck(:perf_perc)
        .sum
    end
end
