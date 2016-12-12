module Spree
  Adjustment.class_eval do
    include Spree::Versionable
    has_paper_trail class_name: 'Spree::AdjustmentVersion'
  end
end
