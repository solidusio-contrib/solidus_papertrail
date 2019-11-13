# frozen_string_literal: true

module Spree
  class ShipmentVersion < PaperTrail::Version
    self.table_name = :spree_shipment_versions
  end
end
