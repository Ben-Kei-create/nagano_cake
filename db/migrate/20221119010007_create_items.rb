class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

# 新規登録で使える。dbに入れる・

      t.string :name, null: false
      t.string :genre_id, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false, default: "true"

      t.timestamps
    end
  end
end
