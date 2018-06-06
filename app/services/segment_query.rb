class SegmentQuery
  def initialize(segment_id)
    @segment_id = segment_id
  end

  def segment_hash_data
    {
      id: raw_segments[:id],
      name: raw_segments[:name],
      distance: raw_segments[:distance],
      average_grade: raw_segments[:average_grade],
      maximum_grade: raw_segments[:maximum_grade],
      elevation_high: raw_segments[:elevation_high],
      elevation_low: raw_segments[:elevation_low],
      total_elevation_gain: raw_segments[:total_elevation_gain],
      athlete_attempts: raw_segments[:effort_count],
      unique_athletes: raw_segments[:athlete_count]
    }
  end

  private
    attr_reader :segment_id

    def raw_segments
      @data ||= StravaService.new(segment_id, self.class).data
    end
end
