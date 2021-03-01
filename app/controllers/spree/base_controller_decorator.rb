module Spree::BaseControllerDecorator

  def self.prepend(base)
    base.before_action :set_paper_trail_whodunnit
  end

  def user_for_paper_trail
    current_spree_user.nil? ? 'Public User' : current_spree_user.id
  end

  ::Spree::BaseController.prepend self
end
