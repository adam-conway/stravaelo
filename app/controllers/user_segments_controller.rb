class UserSegmentsController < ApplicationController
  def update
    TournamentUpdater.new(Tournament.find(params[:id])).update
    flash[:success] = 'Updated PR times!'
  end
end
