module ETL#:nodoc:
  def self.version
    @version ||= load_from_yaml
  end

  def self.load_from_yaml
    yaml = YAML.load_file(File.dirname(__FILE__) + "/../../VERSION.yml")
    "#{yaml[:major]}.#{yaml[:minor]}.#{yaml[:patch]}"
  end
end
