class VersionsAdapter

  def self.create(elements)
    collection = []
    elements.each do |element|
      if element.respond_to?(:versions)
        element.versions.each do |version|
          unless version.object.nil?
            prototype = YamlAdapter.create(version.object, element.class)
            prototype.who = version.originator.to_i
            collection << prototype
          end
        end
      end
    end
    collection
  end
end