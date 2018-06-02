class UserMailer < ApplicationMailer
  def challenge_email
    @tournament_id = params[:tournament_id]
    @challenger = params[:challenger].name
    @challengee = params[:challengee]
    mail(to: @challengee.email, subject: "#{@challenger} has challenged you to a Strava tournament!")
  end
end
