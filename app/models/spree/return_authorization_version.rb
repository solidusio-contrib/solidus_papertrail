# frozen_string_literal: true

module Spree
  class ReturnAuthorizationVersion < PaperTrail::Version
    self.table_name = :spree_return_authorization_versions
  end
end
