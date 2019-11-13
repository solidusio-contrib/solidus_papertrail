# frozen_string_literal: true

module Spree
  module Versionable
    attr_accessor :who, :version_changes, :version_id, :version_event, :version_date

    def who=(user_id)
      user = Spree::User.find(user_id)
      @who = "#{user.first_name} #{user.last_name}"
    rescue StandardError
      @who = 'Unknown'
    end
  end
end
