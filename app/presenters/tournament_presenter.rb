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

  def active_users
    tournament.active_users
  end

  def segment_ranking(user, segment)
    time = UserSegment.where(segment: segment).where(user: user).first&.pr
    if time.nil?
      "-"
    else
      Time.at(time).utc.strftime("%H:%M:%S")
    end
  end

  def pending_users
    tournament.pending_users
  end
end
