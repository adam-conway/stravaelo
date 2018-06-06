class KomQuery
  def initialize(segment_id)
    @segment_id = segment_id
  end

  def kom_data
    raw_kom_data[:entries].first[:elapsed_time]
  end

  private
    attr_reader :segment_id

    def raw_kom_data
      @data ||= StravaService.new(segment_id, self.class).data
    end
end
