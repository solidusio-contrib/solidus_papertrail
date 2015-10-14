module Spree
  class OrderVersion < PaperTrail::Version
    self.table_name = :spree_order_versions
  end
end 