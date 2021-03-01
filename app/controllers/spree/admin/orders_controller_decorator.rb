module Spree::Admin::OrdersControllerDecorator
  def versions
    @order = Spree::Order.find_by_number params[:id]

    @versions = VersionsAdapter.create([@order])

    payments = @order.payments.order(updated_at: :asc)
    @payment_versions = VersionsAdapter.create(payments)

    shipments = @order.shipments.order(updated_at: :desc)
    @shipment_versions = VersionsAdapter.create(shipments)

    line_items = @order.line_items.order(updated_at: :desc)
    @line_item_versions = VersionsAdapter.create(line_items)

    adjustments = @order.all_adjustments.order(updated_at: :desc)
    @adjustment_versions = VersionsAdapter.create(adjustments)

    return_authorizations = @order.return_authorizations.order(updated_at: :desc)
    @return_authorization_versions = VersionsAdapter.create(return_authorizations)
  end

  ::Spree::Admin::OrdersController.prepend self
end