class StravaService
  attr_reader :data_requested

  def initialize(segment_id, data_requested, token = ENV['strava_my_token'])
    @token = token
    @segment_id = segment_id
    @data_requested = data_requested
  end

  def data
    JSON.parse(query.body, symbolize_names: true)
  end

private
  attr_reader :segment_id, :token

  def query
    if data_requested == SegmentQuery
      segment_query
    elsif data_requested == UserRankingQuery
      user_ranking_query
    elsif data_requested == KomQuery
      kom_query
    end
  end

  def segment_query
    Faraday.get "https://www.strava.com/api/v3/segments/#{segment_id}?access_token=#{token}"
  end

  def user_ranking_query
    Faraday.get "https://www.strava.com/api/v3/segments/#{segment_id}/all_efforts?access_token=#{token}"
  end

  def kom_query
    Faraday.get "https://www.strava.com/api/v3/segments/#{segment_id}/leaderboard?page=1&per_page=1&access_token=#{token}"
  end

end
