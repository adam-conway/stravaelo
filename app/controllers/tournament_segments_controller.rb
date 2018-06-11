class TournamentSegmentsController < ApplicationController
  def new
    tournament = Tournament.find(params[:tournament_id])
    if TournamentSegment.create(tournament_id: params[:tournament_id], segment_id: params[:segment_id])
      flash[:success] = "Segment added!"
    else
      flash[:error] = "Unable to add segment"
    end
    redirect_to tournament_path(tournament)
  end

  def destroy
    tournament = Tournament.find(params[:tournament_id])
    tournament_segment = TournamentSegment.find_by(tournament_id: params[:tournament_id], segment_id: params[:id])
    if tournament_segment.destroy
      flash[:success] = 'Removed Segment'
    else
      flash[:error] = 'Failed to remove segment'
    end
    redirect_to tournament_path(tournament)
  end
end
