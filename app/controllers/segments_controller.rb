class SegmentsController < ApplicationController
  def index
    @segment = Segment.new
    @segments = Segment.all.order(:name)
  end

  def new
  end

  def create
    if Segment.find_by_id(params[:segment][:id])
      flash[:failure] = "This segment has already been added"
    else
      segment_hash = SegmentQuery.new(params[:segment][:id]).segment_hash_data
      segment = Segment.create(segment_hash)
      segment.update(kom_time: KomQuery.new(segment.id).kom_data)
      flash[:success] = "#{segment.name} was successfully added"
    end
    redirect_to segments_path
  end

  def destroy
    @segment = Segment.find(params[:id])
    if @segment.destroy
      flash[:success] = "Segment deleted"
      redirect_to segments_path
    else
      flash[:error] = "Failed to delete segment"
      redirect_to segments_path
    end
  end

end
