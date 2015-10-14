class VersionsAdapter

  def self.create(elements)
    collection = []
    elements.each do |element|
      if element.respond_to?(:versions)
        versions = element.versions.order(:object, created_at: :asc)
        versions.each do |version|
          prototype = version.object.nil? ? element.class.new : YamlAdapter.create(version.object, element.class)
          prototype.who = version.originator.to_i
          prototype.version_id = version.id
          prototype.version_event = version.event
          prototype.version_changes = version.changeset
          prototype.version_date    = version.created_at
          collection << prototype
        end
        # prototype = element
        # prototype.who = element.versions.last.try(:terminator).try(:to_i)
        # collection << prototype
      end
    end
    collection
  end
end