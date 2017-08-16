module SolidusPapertrail
  class Railtie < Rails::Railtie
    initializer "solidus_papertrail.configure_rails_initialization" do
      ActiveSupport.on_load(:action_controller) do
        before_action :set_paper_trail_whodunnit
      end
    end
  end
end
