class Customer < ApplicationRecord
  # has_many :addresses, :orders, :cart_items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
