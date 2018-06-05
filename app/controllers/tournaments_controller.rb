class TournamentsController < ApplicationController
  def show
    @tournament_presenter = TournamentPresenter.new(params)
  end

  def new
    @tournament = Tournament.new
    @segments = Segment.order(:name)
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      builder = TournamentBuilder.new(@tournament, params, current_user)
      builder.add_user
      builder.add_segments
      builder.add_user_prs
      flash[:success] = "Created a new tournament"
      redirect_to tournament_path(@tournament)
    else
      flash[:error] = "Failed to create new tournament"
      render :new
    end
  end

  private
    def tournament_params
      params.require(:tournament).permit(:name)
    end
end
