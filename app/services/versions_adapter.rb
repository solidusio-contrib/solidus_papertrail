# frozen_string_literal: true

class VersionsAdapter
  def self.create(elements)
    collection = []
    elements.each do |element|
      next unless element.respond_to?(:versions)

      versions = element.versions.order(:object, created_at: :asc)
      versions.each do |version|
        prototype = version.object.nil? ?
          element.class.new :
          YamlAdapter.new(version.object, element.class).deserialize
        prototype.who = version.whodunnit
        prototype.version_id = version.id
        prototype.version_event = version.event
        prototype.version_changes = version.object_changes
        prototype.version_date    = version.created_at
        collection << prototype
      end
      collection << element
    end
    collection
  end
end
