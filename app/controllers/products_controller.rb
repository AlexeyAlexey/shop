class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # GET /products or /products.json
  def index
    @products = Product.all
    @show_share_purchased_link_modal = params.permit(:show_share_purchased_link_modal) || false
  end

  # GET /products/1
  def show
    respond_to do |format|
      format.html { render partial: "product_dialog", locals: { product: @product } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.expect(product: [ :title, :description, :preview_img, :images ])
    end

    def find_product
      # TODO render notice if product cannot be found
      @product = Product.find_by(id: params_product_id)
    end
end
