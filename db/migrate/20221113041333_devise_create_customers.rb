class DeviseCreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|

      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :telephone_number, null: false
      t.boolean :is_deleted, null: false, default: "false"
      t.timestamps null: false
    end

    # add_index :customers, :email,                unique: true
    # add_index :customers, :reset_password_token, unique: true
   end
end
