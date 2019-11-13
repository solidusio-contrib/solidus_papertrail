# frozen_string_literal: true

module Spree
  class PaymentVersion < PaperTrail::Version
    self.table_name = :spree_payment_versions
  end
end
