class UserTournamentsController < ApplicationController
  def create
    tournament = Tournament.find(params[:tournament_id])
    if User.find_by(email: params[:invite_email])
      binding.pry
    end
    redirect_to tournament_path(tournament)
  end
end
