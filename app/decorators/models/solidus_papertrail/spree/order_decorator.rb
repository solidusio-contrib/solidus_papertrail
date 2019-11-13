# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.class_eval do
          include ::Spree::Versionable
          has_paper_trail class_name: '::Spree::OrderVersion'
        end
      end

      ::Spree::Order.prepend self
    end
  end
end
