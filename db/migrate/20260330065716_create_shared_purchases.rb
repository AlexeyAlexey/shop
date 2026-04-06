class CreateSharedPurchases < ActiveRecord::Migration[8.1]
  def change
    create_table :shared_purchases, id: :uuid do |t|
      t.uuid :product_id
      t.uuid :shared_purchase_link_id

      t.timestamps
    end

    add_index :shared_purchases, [ :shared_purchase_link_id, :product_id ], unique: true
  end
end
