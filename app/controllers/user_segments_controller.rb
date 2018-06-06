class UserSegmentsController < ApplicationController
  def update
    TournamentUpdater.new(Tournament.find(params[:id])).update
  end
end
