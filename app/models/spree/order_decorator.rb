module Spree::OrderDecorator
  include Spree::Versionable

  def self.prepended(base)
    base.has_paper_trail class_name: 'Spree::OrderVersion'
  end

  Spree::Order.prepend self
end
