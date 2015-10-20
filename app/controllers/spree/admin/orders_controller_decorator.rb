Spree::Admin::OrdersController.class_eval do
  def versions
    @order = Spree::Order.find_by_number params[:id]

    @versions = VersionsAdapter.create([@order])

    payments = @order.payments.order(updated_at: :asc)
    @payment_versions = VersionsAdapter.create(payments)

    shipments = @order.shipments.order(updated_at: :desc)
    @shipment_versions = VersionsAdapter.create(shipments)

    return_authorizations = @order.return_authorizations.order(updated_at: :desc)
    @return_authorization_versions = VersionsAdapter.create(return_authorizations)
  end
end