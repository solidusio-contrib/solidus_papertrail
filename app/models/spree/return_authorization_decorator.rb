module Spree
  ReturnAuthorization.class_eval do
    include Spree::Versionable
    has_paper_trail class_name: 'Spree::ReturnAuthorizationVersion'
  end
end
