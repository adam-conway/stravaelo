class TournamentPresenter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def tournament
    @tournament ||= Tournament.find(params[:id])
  end

  def segments_alphabetically
    @segments ||= tournament.segments.alphabetical
  end

  def all_other_segments
    @not_used_segments ||= Segment.excluded_segments(tournament.segments)
  end

  def kom_times
    segments_alphabetically.kom_times
  end

  def active_users
    @active_users ||= tournament.active_users
  end

  def pending_users
    @pending_users ||= tournament.pending_users
  end

  def total_user_performance_score(user)
    user.total_tournament_score(tournament)
  end

  def user_rank
    @rank ||= active_users.tournament_ranked(tournament)
  end

  def user_rank_scores
    tournament.total_user_scores
  end

  def kom_time(segment)
    Time.at(segment.kom_time).utc.strftime("%H:%M:%S")
  end

  def user_times_and_scores(user)
    user.pr_and_scores(tournament)
  end

  def segment_times_and_scores(segment)
    segment.pr_and_scores(tournament)
  end

end
