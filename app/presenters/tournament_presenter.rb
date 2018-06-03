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
    user_ranking_query(user, segment)
  end

  def pending_users
    tournament.pending_users
  end

  private

    def user_ranking_query(user, segment)
      UserRankingQuery.new(user, segment).run
    end
end
