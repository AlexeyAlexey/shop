class AddSlideImgsToProducts < ActiveRecord::Migration[8.1]
  def change
    add_column :products, :slide_imgs, :string, array: true, default: []
  end
end
