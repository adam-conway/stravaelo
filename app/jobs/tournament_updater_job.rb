class TournamentUpdaterJob < ApplicationJob
  queue_as :default

  def perform(tournament)
    TournamentUpdater.new(tournament).update
  end
end
