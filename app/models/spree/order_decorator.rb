module Spree
  Order.class_eval do
    has_paper_trail
  end
end