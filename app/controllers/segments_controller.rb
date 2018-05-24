class SegmentsController < ApplicationController
  def index
    @segment = Segment.new
    @segments = Segment.all
  end

  def new
  end

  def create
    if Segment.find_by_id(params[:segment][:id])
      flash[:failure] = "This segment has already been added"
    else
      segment_hash = SegmentQuery.new(params[:segment][:id]).segment_hash_data
      segment = Segment.create(segment_hash)
      flash[:success] = "#{segment.name} was successfully added"
    end
    redirect_to segments_path
  end
end
