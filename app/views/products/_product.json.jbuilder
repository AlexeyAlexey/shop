json.extract! product, :id, :title, :description, :preview_img, :images, :created_at, :updated_at
json.url product_url(product, format: :json)
