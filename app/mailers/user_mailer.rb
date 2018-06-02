class UserMailer < ApplicationMailer
  def challenge_email
    @challenger = params[:challenger].name
    @challengee = params[:challengee]
    mail(to: @challengee, subject: "#{@challenger} has challenged you to a Strava tournament!")
  end
end
