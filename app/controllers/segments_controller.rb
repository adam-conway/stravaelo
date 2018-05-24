class SegmentsController < ApplicationController
  def index
  end

  def new
    @segment = Segment.new
  end

  def create
    if Segment.find_by_id(params[:segment][:id])
      flash[:error] = "This segment has already been added"
      redirect_to new_segment_path
    else
      segment_hash = SegmentQuery.new(params[:segment][:id]).segment_hash_data
      segment = Segment.create(segment_hash)
      flash[:success] = "#{segment.name} was successfully added"
      redirect_to segments_path
    end
  end
end
