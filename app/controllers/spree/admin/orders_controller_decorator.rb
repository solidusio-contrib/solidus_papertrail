Spree::Admin::OrdersController.class_eval do
  before_action :load_order, :only => [:edit, :update, :fire, :resend, :open_adjustments, :close_adjustments, :versions, :payment_versions, :shipment_versions]

  def versions
    
  end

  def payment_versions
    @payment_versions = VersionsAdapter.create(@order.payments)
  end

  def shipment_versions
    
  end
end