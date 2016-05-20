class YamlAdapter
  attr_reader :payload, :klass

  def initialize text, klass
    @data = YAML.load(text)
    @klass = klass
  end

  def deserialize
    @klass.new(permitted_data)
  end

  private

  # The below two methods prevent papertrail from
  # attempting to instantiate models with attributes
  # they do not have definitions for or do not have
  # the corresponding columns in the database.
  #
  # Both cases are exceptional, so we filter this here.
  def permitted_data
    keys = @klass.column_names.to_set
    @data.keep_if do |key, _|
      keys.include?(key)
    end
  end
end
