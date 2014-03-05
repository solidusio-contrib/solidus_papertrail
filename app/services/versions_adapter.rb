class VersionsAdapter

  def self.create(elements)
    collection = []
    elements.each do |element|
      if element.respond_to?(:versions)
        versions = element.versions.order(:object, created_at: :desc)
        versions.each do |version|
          unless version.object.nil?
            prototype = YamlAdapter.create(version.object, element.class)
            prototype.who = version.originator.to_i
            collection << prototype
          end
        end
        prototype = element
        prototype.who = element.versions.last.terminator.to_i
        collection << prototype
      end
    end
    collection
  end
end