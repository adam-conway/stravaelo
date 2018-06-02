class AddStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :status, :integer, default: 0
    # change_column :games, :current_turn, :integer, default: 0
  end
end
