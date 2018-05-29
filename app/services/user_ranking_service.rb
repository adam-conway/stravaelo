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
    # https://www.strava.com/api/v3/segments/5816161/all_efforts?access_token=489ed4cead0b0624997d0c026200a6912e8662b5
  end


end
