Spree::Api::BaseController.class_eval do
  before_action :set_paper_trail_whodunnit

  def user_for_paper_trail
    current_api_user.nil? ? 'Public User' : current_api_user.id
  end
end
