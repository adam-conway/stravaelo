class UserTournamentsController < ApplicationController
  def create
    tournament = Tournament.find(params[:tournament_id])
    if User.find_by(email: params[:invite_email]) && !tournament.users.pluck(:email).include?(params[:invite_email])
      tournament.user_tournaments.create(user_id: User.find_by(email: params[:invite_email]).id)
    elsif tournament.users.pluck(:email).include?(params[:invite_email])
      flash[:error] = "That user is already part of this tournament!"
    else
      @user = User.create(email: params[:invite_email], status: 1)
      tournament.user_tournaments.create(user_id: @user.id)
      UserMailer.with(challengee: @user, challenger: tournament.users.first, tournament_id: tournament.id).challenge_email.deliver_now
    end
    redirect_to tournament_path(tournament)
  end

  def destroy
    tournament = Tournament.find(params[:tournament])
    @user_tournament = UserTournament.find_by(user_id: params[:id], tournament_id: params[:tournament])
    if @user_tournament.destroy
      flash[:success] = 'Athlete Removed'
    else
      flash[:error] = 'Failed to remove athlete'
    end
    redirect_to tournament_path(tournament)
  end
end
