# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module ReturnAuthorizationDecorator
      def self.prepended(base)
        base.class_eval do
          include ::Spree::Versionable
          has_paper_trail class_name: '::Spree::ReturnAuthorizationVersion'
        end
      end

      ::Spree::ReturnAuthorization.prepend self
    end
  end
end
