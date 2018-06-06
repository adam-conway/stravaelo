class TournamentBuilder
  attr_reader :tournament, :params, :user

  def initialize(tournament, params, user)
    @tournament = tournament
    @params     = params
    @user       = user
  end

  def add_user
    @tournament.user_tournaments.create(user_id: user.id)
  end

  def add_segments
    create_tournament_segments(params)
  end

  def add_user_prs
    TournamentUpdater.new(tournament).update
  end

  private

    def create_tournament_segments(params)
      params[:segments].each do |id|
        @tournament.tournament_segments.create(segment_id: id.to_i)
      end
    end
end
