class YamlAdapter
  def self.create text, klass
    data = YAML.load(text)
    klass.new(data)
  end
end