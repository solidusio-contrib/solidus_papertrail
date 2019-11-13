# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module LineItemDecorator
      def self.prepended(base)
        base.class_eval do
          include ::Spree::Versionable
          has_paper_trail class_name: '::Spree::LineItemVersion'
        end
      end
    end
  end
end
