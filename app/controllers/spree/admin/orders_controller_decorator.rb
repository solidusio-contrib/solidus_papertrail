Spree::Admin::OrdersController.class_eval do
  before_action :load_order, :only => [:edit, :update, :fire, :resend, :open_adjustments, :close_adjustments, :versions, :payment_versions, :shipment_versions, :return_authorization_versions]

  def versions
    @versions = VersionsAdapter.create([@order])
  end

  def payment_versions
    payments = @order.payments.order(updated_at: :asc)
    @payment_versions = VersionsAdapter.create(payments)
  end

  def shipment_versions
    shipments = @order.shipments.order(updated_at: :desc)
    @shipment_versions = VersionsAdapter.create(shipments)
  end

  def return_authorization_versions
    return_authorizations = @order.return_authorizations.order(updated_at: :desc)
    @return_authorization_versions = VersionsAdapter.create(return_authorizations)
  end
end