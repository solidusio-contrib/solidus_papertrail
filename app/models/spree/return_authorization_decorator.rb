module Spree::ReturnAuthorizationDecorator
  include Spree::Versionable

  def self.prepended(base)
    base.has_paper_trail class_name: 'Spree::ReturnAuthorizationVersion'
  end

  Spree::ReturnAuthorization.prepend self
end
