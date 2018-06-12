class TournamentPresenter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def tournament
    @tournament ||= Tournament.find(params[:id])
  end

  def segments_alphabetically
    @segments ||= tournament.segments.order(:name)
  end

  def all_other_segments
    @not_used_segments ||= Segment.where.not(id: segments_alphabetically.pluck(:id)).order(:name)
  end

  def kom_times
    segments_alphabetically.pluck(:kom_time).map do |kom_time|
      Time.at(kom_time).utc.strftime("%H:%M:%S")
    end
  end

  def active_users
    @active_users ||= tournament.active_users
  end

  def segment_ranking(user, segment)
    time = UserSegment.where(segment_id: segment).where(user_id: user).first&.pr
    if time == 0 || time.nil?
      "-"
    else
      Time.at(time).utc.strftime("%H:%M:%S")
    end
  end

  def pending_users
    @pending_users ||= tournament.pending_users
  end

  def user_times_and_scores(user)
    user_times(user).zip(user_scores(user))
  end

  def total_user_performance_score(user)
    UserTournament.where(user_id: user.id, tournament_id: tournament.id).first.total_perf_perc&.round(2)
  end

  def user_rank
    @rank ||= active_users.includes(:user_tournaments).order('user_tournaments.total_perf_perc DESC')
  end

  def user_rank_scores
    user_rank.pluck('user_tournaments.total_perf_perc').map {|score| score&.round(2)}
  end

  def kom_time(segment)
    Time.at(segment.kom_time).utc.strftime("%H:%M:%S")
  end

  def segment_times_and_scores(segment)
    segment_times(segment).zip(segment_scores(segment))
  end

  private

    def user_times(user)
      segments_alphabetically.includes(:user_segments).where("user_segments.user_id = #{user.id}").pluck(:pr).map do |pr|
        if pr == 0
          '-'
        else
          Time.at(pr).utc.strftime("%H:%M:%S")
        end
      end
    end

    def user_scores(user)
      segments_alphabetically.includes(:user_segments).where("user_segments.user_id = #{user.id}").pluck(:perf_perc).map do |score|
        if score == 0
          ""
        else
          "(Score: #{score&.round(2)})"
        end
      end
    end

    def segment_times(segment)
      user_rank.includes(:user_segments).where("user_segments.segment_id = #{segment.id}").pluck(:pr).map do |pr|
        if pr == 0
          '-'
        else
          Time.at(pr).utc.strftime("%H:%M:%S")
        end
      end
    end

    def segment_scores(segment)
      user_rank.includes(:user_segments).where("user_segments.segment_id = #{segment.id}").pluck(:perf_perc).map do |score|
        if score == 0
          ""
        else
          "(Score: #{score&.round(2)})"
        end
      end
    end
end
