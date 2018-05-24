class SegmentQuery
  def initialize(segment_id)
    @segment_id = segment_id
  end

  def segment_hash_data
  end

  private
    attr_reader :segment_id

    def raw_segments
      SegmentService.new(segment_id).data
    end
end
