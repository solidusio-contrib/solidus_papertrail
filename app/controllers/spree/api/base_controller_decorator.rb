# frozen_string_literal: true

Spree::Api::BaseController.class_eval do
  def user_for_paper_trail
    current_api_user.nil? ? 'Public User' : current_api_user.id
  end
end
