class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :like_post_id
      t.integer :liked_post_id
      t.timestamps
    end
  end
end
