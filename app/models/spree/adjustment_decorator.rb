module Spree::AdjustmentDecorator
  include Spree::Versionable

  def self.prepended(base)
    base.has_paper_trail class_name: 'Spree::AdjustmentVersion'
  end

  Spree::Adjustment.prepend self
end
