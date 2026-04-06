class SharedPurchase < ApplicationRecord
  belongs_to :product

  validates :shared_purchase_link_id, uniqueness: { scope: :product_id, message: "should be uniq" }
end
