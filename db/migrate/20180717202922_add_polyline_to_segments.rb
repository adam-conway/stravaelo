class AddPolylineToSegments < ActiveRecord::Migration[5.2]
  def change
    add_column :segments, :polyline, :string
  end
end
