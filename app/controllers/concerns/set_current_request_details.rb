module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do
    before_action :set_current_request_details
  end

  private
    def set_current_request_details
      set_shared_purchase_link_id
    end

    def set_shared_purchase_link_id
      Current.shared_purchase_link_id = cookies[:shared_purchase_link_id]
    end
end
