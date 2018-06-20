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
    # user_times(user).zip(user_scores(user))
  end

  def segment_times_and_scores(segment)
    segment.pr_and_scores(tournament)
    # segment_times(segment).zip(segment_scores(segment))
  end

  private

    # def user_times(user)
    #   segments_alphabetically.includes(:user_segments).where("user_segments.user_id = #{user.id}").pluck(:pr).map do |pr|
    #     if pr == 0
    #       '-'
    #     else
    #       Time.at(pr).utc.strftime("%H:%M:%S")
    #     end
    #   end
    # end
    #
    # def user_scores(user)
    #   segments_alphabetically.includes(:user_segments).where("user_segments.user_id = #{user.id}").pluck(:perf_perc).map do |score|
    #     if score == 0
    #       ""
    #     else
    #       "(Score: #{score&.round(2)})"
    #     end
    #   end
    # end

    def segment_times(segment)
      Segment.find(segment.id).user_segments
                              .includes(user: [:user_tournaments])
                              .where("user_tournaments.tournament_id = #{tournament.id}")
                              .order('user_tournaments.total_perf_perc DESC')
                              .uniq
                              .pluck(:pr).map do |pr|
        if pr == 0
          '-'
        else
          Time.at(pr).utc.strftime("%H:%M:%S")
        end
      end
    end

    def segment_scores(segment)
      Segment.find(segment.id).user_segments
                              .includes(user: [:user_tournaments])
                              .where("user_tournaments.tournament_id = #{tournament.id}")
                              .order('user_tournaments.total_perf_perc DESC')
                              .uniq
                              .pluck(:perf_perc).map do |score|
        if score == 0
          ""
        else
          "(Score: #{score&.round(2)})"
        end
      end
    end
end
