class AddSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :segments do |t|
      t.string :name
      t.float :distance
      t.float :average_grade
      t.float :maximum_grade
      t.float :elevation_high
      t.float :elevation_low
      t.float :total_elevation_gain
      t.integer :athlete_attempts
      t.integer :unique_athletes

      t.timestamps
    end
  end
end
