class UserRankingQuery
  attr_reader :user, :segment

  def initialize(user, segment)
    @user = user
    @segment = segment
  end

  def run
    segment_speed(user.token, segment.id)
  end

  private
    attr_reader :segment_id

    def segment_speed(token, segment_id)
      efforts = StravaService.new(segment_id, self.class, token).data
      if efforts == [] || efforts.class != Array
        0
      else
        efforts.first[:elapsed_time]
      end
    end
end
