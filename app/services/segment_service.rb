class SegmentService
  def initialize(segment_id)
    @segment_id = segment_id
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end

private
  attr_reader :segment_id

  def response
    Faraday.get "https://www.strava.com/api/v3/segments/#{segment_id}?access_token=#{ENV}"
  end


end
