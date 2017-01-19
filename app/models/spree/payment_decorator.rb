module Spree
  Payment.class_eval do
    include Spree::Versionable
    has_paper_trail class_name: 'Spree::PaymentVersion'
  end
end
