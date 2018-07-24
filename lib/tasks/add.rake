namespace :add do
  desc "Adds updated_at data to user_segments and user_tournaments"
  task updated_at_to_user_segment: :environment do
    UserSegment.all.each do |us|
      us.update(updated_at: 25.hours.ago)
    end
    UserTournament.all.each do |us|
      us.update(updated_at: 25.hours.ago)
    end
  end

end
