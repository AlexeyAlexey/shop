class SharedPurchaseLinksController < ApplicationController
  before_action :set_shared_purchase_link, only: %i[ connect ]
  before_action :check_if_already_exists, only: %i[ create ]

  # GET /shared_purchase_links/1 or /shared_purchase_links/1.json
  def connect
    if @shared_purchase_link
      cookies[:shared_purchase_link_id] = @shared_purchase_link.id

      redirect_to products_path
    else
      redirect_to products_path
    end
  end

  # POST /shared_purchase_links or /shared_purchase_links.json
  def create
    @shared_purchase_link = SharedPurchaseLink.new()

    respond_to do |format|
      if @shared_purchase_link.save
        cookies[:shared_purchase_link_id] = @shared_purchase_link.id

        format.html { render partial: "copy_dialog", locals: { uri: helpers.generate_shared_purchase_uri(@shared_purchase_link.id) } }
      else
        format.json { render json: @shared_purchase_link.errors, status: :unprocessable_entity }
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_purchase_link
      @shared_purchase_link = SharedPurchaseLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shared_purchase_link_params
      params.fetch(:shared_purchase_link, {})
    end

    def check_if_already_exists
      if Current.shared_purchase_link_id.present?
        respond_to do |format|
          format.html { render partial: "copy_dialog", locals: { uri: helpers.generate_shared_purchase_uri(Current.shared_purchase_link_id) } }
        end
      end
    end
end
