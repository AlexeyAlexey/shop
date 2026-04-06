class SharedPurchasesController < ApplicationController
  # TODO Implement check if shared_purchase_link_id is included to cookies
  # before_action :find_shared_purchase_link, only: %i[ share ]

  # GET /shared_purchases or /shared_purchases.json
  def index
    @shared_purchases = SharedPurchase.where(shared_purchase_link_id: shared_purchase_link_id).eager_load(:product)

    respond_to do |format|
      format.html { render partial: "index", locals: { shared_purchases: @shared_purchases } }
    end
  end

  # DELETE /shared_purchases/1 or /shared_purchases/1.json
  def destroy
    SharedPurchase.find_by(shared_purchase_link_id: shared_purchase_link_id, product_id: params_product_id)&.destroy

    respond_to do |format|
      Turbo::StreamsChannel.broadcast_render_later_to([ shared_purchase_link_id, :shared_purchases ], template: "shared_purchases/remove_product", locals: { product_id: params_product_id })

      format.turbo_stream { render "remove_product", locals: { product_id: params_product_id } }
    end
  end
  #
  ## POST /shared_purchases/:id/share
  def share
    @shared_purchase = SharedPurchase.new({ shared_purchase_link_id: shared_purchase_link_id, product_id: params_product_id })

    respond_to do |format|
      if @shared_purchase.save
        Turbo::StreamsChannel.broadcast_render_later_to([ shared_purchase_link_id, :shared_purchases ], template: "shared_purchases/added_product", locals: { shared_purchase: @shared_purchase })
        format.turbo_stream { render "added_product", locals: { shared_purchase: @shared_purchase } }
      else
        if @shared_purchase.errors.where(:shared_purchase_link_id, :taken)
          format.turbo_stream { render "added_product", locals: { shared_purchase: @shared_purchase } }
        else
          # TODO add flash notice
          # format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @shared_purchase.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_shared_purchase
    #   @shared_purchase = SharedPurchase.find(params.expect(:id))
    # end
    #

    # Only allow a list of trusted parameters through.
    def params_product_id
      params.expect(:product_id)
    end

    def shared_purchase_link_id
      Current.shared_purchase_link_id
    end
end
