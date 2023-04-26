class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true #referencesという記述で自動的にIDを作成してしてくれる　１1対多
      t.text :title
      t.text :explanation
      t.integer :prefecture_id
      t.text :comment
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
