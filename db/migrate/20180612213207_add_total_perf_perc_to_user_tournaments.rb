class AddTotalPerfPercToUserTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tournaments, :total_perf_perc, :float
  end
end
