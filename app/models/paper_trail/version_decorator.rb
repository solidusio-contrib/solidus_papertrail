module PaperTrail
  module VersionDecorator
    Version.class_eval do
      self.abstract_class = true
    end
  end
end
