class UserSegmentsController < ApplicationController
  def update
    tournament = Tournament.find(params[:id])
    TournamentUpdater.new(tournament).update
    flash[:success] = 'Updated PR times!'
    redirect_to tournament_path(tournament)
  end
end
