module SharedPurchaseLinksHelper
  def generate_shared_purchase_uri(shared_purchase_link_id)
    url_for(controller: "shared_purchase_links", action: "connect", id: shared_purchase_link_id, only_path: false)
  end
end
