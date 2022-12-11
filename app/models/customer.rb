class Customer < ApplicationRecord
  has_many :addresses, dependent: :destroy
  # :orders, :cart_items,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
