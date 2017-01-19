Spree::BaseController.class_eval do
  def user_for_paper_trail
    current_spree_user.nil? ? 'Public User' : current_spree_user.id
  end
end
