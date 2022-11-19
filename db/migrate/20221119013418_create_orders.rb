class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shopping_cost, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false, default: "0"
      t.integer :is_active, null: false, default: "false"

      t.timestamps
    end
  end
end
