class AddPrToUserSegments < ActiveRecord::Migration[5.2]
  def change
    add_column :user_segments, :pr, :integer
  end
end
