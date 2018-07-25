class AddTimestampsToUserSegments < ActiveRecord::Migration[5.2]
  def change
    add_column :user_segments, :created_at, :datetime
    add_column :user_segments, :updated_at, :datetime
  end
end
