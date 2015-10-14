module Spree
  class PaymentVersion < PaperTrail::Version
    self.table_name = :spree_payment_versions
  end
end 