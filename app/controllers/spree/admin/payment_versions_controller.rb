class Spree::Admin::PaymentVersionsController < Spree::Admin::ResourceController
  
  before_action :load_order, only: [:index]

  def index
    @payment_versions = VersionsAdapter.create(@order.payments)
    raise
  end

  private

  def load_order
    @order = Spree::Order.find params[:order_id]
  end
end