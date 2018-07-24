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
        UserSegmentUpdater.update(user_segment)
      end
      user_tournament = UserTournament
                          .where(tournament_id: tournament.id, user_id: user.id)
                          .first_or_create
      UserTournamentUpdater.update(user_tournament)
    end
  end
end
