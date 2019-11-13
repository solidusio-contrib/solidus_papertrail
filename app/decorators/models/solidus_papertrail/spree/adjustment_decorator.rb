# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module AdjustmentDecorator
      def self.prepended(base)
        base.class_eval do
          include ::Spree::Versionable
          has_paper_trail class_name: '::Spree::AdjustmentVersion'
        end
      end

      ::Spree::Adjustment.prepend self
    end
  end
end
