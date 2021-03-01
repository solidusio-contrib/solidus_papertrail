module Spree::Api::BaseControllerDecorator

  def self.prepend(base)
    base.before_action :set_paper_trail_whodunnit
  end

  def user_for_paper_trail
    current_api_user.nil? ? 'Public User' : current_api_user.id
  end

  ::Spree::Api::BaseController.prepend self
end
