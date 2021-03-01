module Spree::ShipmentDecorator
  include Spree::Versionable

  def self.prepended(base)
    base.has_paper_trail class_name: 'Spree::ShipmentVersion'
  end

  Spree::Shipment.prepend self
end
