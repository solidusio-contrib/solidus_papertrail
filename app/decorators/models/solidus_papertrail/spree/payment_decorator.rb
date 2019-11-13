# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module PaymentDecorator
      def self.prepended(base)
        base.class_eval do
          include ::Spree::Versionable
          has_paper_trail class_name: '::Spree::PaymentVersion'
        end
      end

      ::Spree::Payment.prepend self
    end
  end
end
