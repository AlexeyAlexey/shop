class SharedPurchaseLinksController < ApplicationController
  before_action :set_shared_purchase_link, only: %i[ connect ]

  # # GET /shared_purchase_links or /shared_purchase_links.json
  # def index
  #   @shared_purchase_links = SharedPurchaseLink.all
  # end

  # # GET /shared_purchase_links/1 or /shared_purchase_links/1.json
  # def show
  # end

  # GET /shared_purchase_links/1 or /shared_purchase_links/1.json
  def connect
    if @shared_purchase_link
      cookies[:shared_purchase_link_id] = @shared_purchase_link.id

      redirect_to products_path
    else
      redirect_to products_path
    end
  end

  # # GET /shared_purchase_links/new
  # def new
  #   @shared_purchase_link = SharedPurchaseLink.new
  # end

  # # GET /shared_purchase_links/1/edit
  # def edit
  # end

  # POST /shared_purchase_links or /shared_purchase_links.json
  def create
    @shared_purchase_link = SharedPurchaseLink.new()
    @shared_purchase_link_id = @shared_purchase_link.id

    # puts(cookies[:shared_purchase_link_id].inspect)
    respond_to do |format|
      if @shared_purchase_link.save
        @shared_purchase_link_id = @shared_purchase_link.id
        cookies[:shared_purchase_link_id] = @shared_purchase_link_id

        uri = url_for(controller: "shared_purchase_links", action: "connect", id: @shared_purchase_link_id, only_path: false)
        format.json { render json: { link: uri } }
        format.html { render partial: "copy_dialog", locals: { uri: uri } }
      else
        format.json { render json: @shared_purchase_link.errors, status: :unprocessable_entity }
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  # # PATCH/PUT /shared_purchase_links/1 or /shared_purchase_links/1.json
  # def update
  #   respond_to do |format|
  #     if @shared_purchase_link.update(shared_purchase_link_params)
  #       format.html { redirect_to @shared_purchase_link, notice: "Shared purchase link was successfully updated.", status: :see_other }
  #       format.json { render :show, status: :ok, location: @shared_purchase_link }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @shared_purchase_link.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /shared_purchase_links/1 or /shared_purchase_links/1.json
  # def destroy
  #   @shared_purchase_link.destroy!

  #   respond_to do |format|
  #     format.html { redirect_to shared_purchase_links_path, notice: "Shared purchase link was successfully destroyed.", status: :see_other }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shared_purchase_link
      @shared_purchase_link = SharedPurchaseLink.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def shared_purchase_link_params
      params.fetch(:shared_purchase_link, {})
    end
end
