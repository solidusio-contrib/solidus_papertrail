# frozen_string_literal: true

module SolidusPapertrail
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: false

      def add_javascripts
        # append_file 'app/assets/javascripts/store/all.js', "//= require store/solidus_papertrail\n"
        # append_file 'app/assets/javascripts/admin/all.js', "//= require admin/solidus_papertrail\n"
      end

      def add_stylesheets
        # inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/solidus_papertrail\n", :before => /\*\//, :verbose => true
        # inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/solidus_papertrail\n", :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=solidus_papertrail'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]'))
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
