# frozen_string_literal: true

module SolidusPapertrail
  module Spree
    module Api
      module BaseControllerDecorator
        def user_for_paper_trail
          current_api_user.nil? ? 'Public User' : current_api_user.id
        end

        ::Spree::Api::BaseController.prepend self
      end
    end
  end
end
