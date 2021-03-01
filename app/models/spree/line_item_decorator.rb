module Spree::LineItemDecorator
  include Spree::Versionable

  def self.prepended(base)
    base.has_paper_trail class_name: 'Spree::LineItemVersion'
  end

  Spree::LineItem.prepend self
end
