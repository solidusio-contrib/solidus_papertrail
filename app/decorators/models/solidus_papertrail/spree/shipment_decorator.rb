# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module ShipmentDecorator
      def self.prepended(base)
        base.class_eval do
          include ::Spree::Versionable
          has_paper_trail class_name: '::Spree::ShipmentVersion'
        end
      end

      ::Spree::Shipment.prepend self
    end
  end
end
