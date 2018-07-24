class AddTimestampsToUserTournaments < ActiveRecord::Migration[5.2]
  def change
    add_column :user_tournaments, :created_at, :datetime
    add_column :user_tournaments, :updated_at, :datetime
  end
end
