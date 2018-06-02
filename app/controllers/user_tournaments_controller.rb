class UserTournamentsController < ApplicationController
  def create
    tournament = Tournament.find(params[:tournament_id])
    if User.find_by(email: params[:invite_email]) && !tournament.users.pluck(:email).include?(params[:invite_email])
      tournament.user_tournaments.create(user_id: User.find_by(email: params[:invite_email]).id)
    elsif tournament.users.pluck(:email).include?(params[:invite_email])
      flash[:error] = "That user is already part of this tournament!"
    else
      UserMailer.with(challengee: params[:invite_email], challenger: tournament.users.first).challenge_email.deliver_now
    end
    redirect_to tournament_path(tournament)
  end
end
