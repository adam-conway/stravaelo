class CreateTournamentSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournament_segments do |t|
      t.references :tournament, foreign_key: true
      t.references :segment, foreign_key: true
    end
  end
end
