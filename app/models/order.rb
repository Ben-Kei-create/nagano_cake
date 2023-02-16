class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum is_active: { waiting_for_payment: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }

  def subtotal
    item.with_tax_price * amount
  end

end
