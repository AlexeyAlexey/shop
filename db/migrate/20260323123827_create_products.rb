class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :title
      t.string :description
      t.string :preview_img

      t.timestamps
    end
  end
end
