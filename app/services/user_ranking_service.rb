class UserRankingService
  def initialize(token, segment_id)
    @token = token
    @segment_id = segment_id
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end

private
  attr_reader :segment_id, :token

  def response
    Faraday.get "https://www.strava.com/api/v3/segments/#{segment_id}/all_efforts?access_token=#{token}"
  end


end
