class UserSegmentUpdaterJob < ApplicationJob
  queue_as :default

  def perform(user_segment)
    UserSegmentUpdater.update(user_segment)
  end
end
