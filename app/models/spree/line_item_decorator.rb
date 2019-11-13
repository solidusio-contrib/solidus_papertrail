# frozen_string_literal: true

module Spree
  LineItem.class_eval do
    include Spree::Versionable
    has_paper_trail class_name: 'Spree::LineItemVersion'
  end
end
