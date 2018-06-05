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
    get_user_prs(@tournament, @user)
  end

  private

    def create_tournament_segments(params)
      params[:segments].each do |id|
        @tournament.tournament_segments.create(segment_id: id.to_i)
      end
    end

    def get_user_prs(tournament, user)
      tournament.segments.each do |segment|
        UserSegment.where(segment_id: segment.id).first_or_create do |user_segment|
          user_segment.user_id    = user.id
          user_segment.segment_id = segment.id
          user_segment.pr         = UserRankingQuery.new(user, segment).run
        end
      end
    end
end
