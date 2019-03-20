class CreateFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :followers do |t|
      t.integer :followed_id, index: true
      t.integer :follower_id, index: true

      t.timestamps
    end
  end
end
