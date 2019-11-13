# frozen_string_literal: true

module PaperTrail
  Version.class_eval do
    self.abstract_class = true
  end
end
