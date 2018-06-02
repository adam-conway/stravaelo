class UserTournamentsController < ApplicationController
  def create
    tournament = Tournament.find(params[:tournament_id])
    if User.find_by(email: params[:invite_email])
      tournament.user_tournaments.create(user_id: User.find_by(email: params[:invite_email]).id)
    end
    redirect_to tournament_path(tournament)
  end
end
