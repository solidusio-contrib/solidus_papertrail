# frozen_string_literal: true

module SolidusPapertrail
  module PaperTrail
    module VersionDecorator
      def self.prepended(base)
        base.class_eval do
          self.abstract_class = true
        end
      end

      ::PaperTrail::Version.prepend self
    end
  end
end
