class UserSegmentUpdater
  def initialize(user_segment)
    @user_segment = user_segment
  end

  def self.update(user_segment)
    new(user_segment).update
  end

  def update
    @user_segment.update(pr: personal_record, perf_perc: performance_percentage)
  end

  private

    def personal_record
      @pr ||= UserRankingQuery.new(@user_segment.user, @user_segment.segment).run
    end

    def performance_percentage
      if personal_record == 0
        0
      else
        @user_segment.segment.kom_time / personal_record.to_f
      end
    end
end
