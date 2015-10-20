module Spree
  class LineItemVersion < PaperTrail::Version
    self.table_name = :spree_line_item_versions
  end
end 