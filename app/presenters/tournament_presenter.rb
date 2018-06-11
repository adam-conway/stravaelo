class TournamentPresenter
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def tournament
    @tournament ||= Tournament.find(params[:id])
  end

  def segments
    tournament.segments
  end

  def all_other_segments
    Segment.where.not(id: segments.pluck(:id)).order(:name)
  end

  def kom_times
    tournament.segments.map do |segment|
      Time.at(segment.kom_time).utc.strftime("%H:%M:%S")
    end
  end

  def active_users
    tournament.active_users
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
    tournament.pending_users
  end

  def user_performance(user, segment)
    score = performance_percentage(user, segment)
    "(Score: #{score})" unless score == 0
  end

  def total_user_performance_score(user)
    tournament.segments.map do |segment|
      performance_percentage(user, segment)
    end.sum.round(2)
  end

  def user_rank
    active_users.sort_by do |user|
      -total_user_performance_score(user)
    end
  end

  private

    def performance_percentage(user, segment)
      user_time = UserSegment.where(segment_id: segment).where(user_id: user).first&.pr
      segment_pr = Segment.find(segment.id).kom_time
      if user_time == 0 || user_time.nil?
        0
      else
        (segment_pr / user_time.to_f).round(2)
      end
    end
end
