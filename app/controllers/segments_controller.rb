class SegmentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    if Segment.find_by_id(params[:id])
      flash[:error] = "This segment has already been added"
    else
      segment_hash = SegmentQuery.new(params[:id]).raw_data
      Segment.create(segment_hash)
    end
  end
end
