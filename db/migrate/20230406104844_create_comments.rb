class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true #referencesという記述で自動的にIDを作成してしてくれる　1対多
      t.integer :post_id
      t.text :body
      t.timestamps
    end
  end
end
