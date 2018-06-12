class AddPerfPercToUserSegments < ActiveRecord::Migration[5.2]
  def change
    add_column :user_segments, :perf_perc, :float
  end
end
