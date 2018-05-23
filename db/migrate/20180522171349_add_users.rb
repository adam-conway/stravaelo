class AddUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :uid
      t.string :token
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
