class AddTimestampsToTournamentSegments < ActiveRecord::Migration[5.2]
  def change
    add_column :tournament_segments, :created_at, :datetime
    add_column :tournament_segments, :updated_at, :datetime
  end
end
