class Api::V1::SegmentsController < ApplicationController
  def index
    render json: Tournament.find(params[:tournament_id]).segments
  end
end
