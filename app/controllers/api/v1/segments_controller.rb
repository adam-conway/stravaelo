class Api::V1::SegmentsController < ApplicationController
  def index
    if params[:user_id]
      render json: Tournament.find(params[:tournament_id]).segments_with_user_scores(params[:user_id])
    else
      render json: Tournament.find(params[:tournament_id]).segments
    end
  end
end
