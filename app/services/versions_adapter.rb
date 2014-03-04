class VersionsAdapter

  def self.create(elements)
    collection = []
    elements.each do |element|
      if element.respond_to?(:versions)
        element.versions.order(created_at: :asc).each do |version|
          unless version.object.nil?
            prototype = YamlAdapter.create(version.object, element.class)
            prototype.who = version.originator.to_i
          else
            prototype = version.item
            prototype.who = version.terminator.to_i
          end
          collection << prototype
        end
      end
    end
    collection
  end
end