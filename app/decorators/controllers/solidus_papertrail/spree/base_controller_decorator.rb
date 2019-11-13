# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module BaseControllerDecorator
      def user_for_paper_trail
        current_spree_user.nil? ? 'Public User' : current_spree_user.id
      end

      ::Spree::BaseController.prepend self
    end
  end
end
