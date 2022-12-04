class DeviseCreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|

      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: "false", default: ""
      t.timestamps null: false
    end
     add_index :admins, :email,                unique: true
     add_index :admins, :reset_password_token, unique: true
    # # add_index :admins, :confirmation_token,   unique: true
    # # add_index :admins, :unlock_token,         unique: true
  end
end
