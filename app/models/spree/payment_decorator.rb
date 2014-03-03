module Spree
  Payment.class_eval do
    has_paper_trail

    attr_accessor :who

    def who=(user_id)
      begin
        @who = Spree::User.find(user_id).full_name
      rescue
        @who = ""
      end
    end
  end
end