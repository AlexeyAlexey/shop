# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#   rails db:seed
require 'faker'

Product.delete_all()
SharedPurchase.delete_all()
50.times do
  Product.create!(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    preview_img: 'https://img.daisyui.com/images/stock/photo-1606107557195-0e29a4b5b4aa.webp',
    slide_imgs: [ "https://img.daisyui.com/images/stock/photo-1625726411847-8cbb60cc71e6.webp",
                   "https://img.daisyui.com/images/stock/photo-1609621838510-5ad474b7d25d.webp",
                   "https://img.daisyui.com/images/stock/photo-1414694762283-acccc27bca85.webp",
                   "https://img.daisyui.com/images/stock/photo-1665553365602-b2fb8e5d1707.webp" ])
end
