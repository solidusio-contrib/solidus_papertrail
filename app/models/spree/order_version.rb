# frozen_string_literal: true

module Spree
  class OrderVersion < PaperTrail::Version
    self.table_name = :spree_order_versions
  end
end
