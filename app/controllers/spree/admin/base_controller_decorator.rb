Spree::BaseController.class_eval do
  def user_for_paper_trail
    spree_current_user.nil? ? 'Public User' : spree_current_user.id
  end
end
