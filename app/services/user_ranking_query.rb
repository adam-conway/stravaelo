class UserRankingQuery
  attr_reader :users_data

  def initialize(users, segments)
    @users = users
    @segments = segments
    @users_data = {}
  end

  def run
    @users.each do |user|
      @users_data[user] = {}
      @segments.each do |segment|
        @users_data[user][segment] = segment_speed(user.token, segment.id)
      end
    end
  end

  private
    attr_reader :segment_id

    def segment_speed(token, segment_id)
      efforts = UserRankingService.new(token, segment_id).data
      binding.pry
      if efforts == []
        nil
      else
        efforts.first[:elapsed_time]
      end
    end
end
