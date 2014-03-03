module Spree
  Shipment.class_eval do
    has_paper_trail
  end
end