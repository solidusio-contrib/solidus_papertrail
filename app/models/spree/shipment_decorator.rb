# frozen_string_literal: true

module Spree
  Shipment.class_eval do
    include Spree::Versionable
    has_paper_trail class_name: 'Spree::ShipmentVersion'
  end
end
