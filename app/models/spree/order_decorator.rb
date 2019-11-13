# frozen_string_literal: true

module Spree
  Order.class_eval do
    include Spree::Versionable
    has_paper_trail class_name: 'Spree::OrderVersion'
  end
end
