class CreateUserSegments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_segments do |t|
      t.references :user, foreign_key: true
      t.references :segment, foreign_key: true
    end
  end
end
