module Spree::PaymentDecorator
  include Spree::Versionable

  def self.prepended(base)
    base.has_paper_trail class_name: 'Spree::PaymentVersion'
  end

  Spree::Payment.prepend self
end
