class CreateSharedPurchaseLinks < ActiveRecord::Migration[8.1]
  def change
    create_table :shared_purchase_links, id: :uuid do |t|
      t.timestamps
    end
  end
end
