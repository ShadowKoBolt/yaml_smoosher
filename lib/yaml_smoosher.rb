require "deep_merge"
require "yaml"
require "erb"

class YamlSmoosher
  VERSION = "1.0.0"

  class << self
    def call(args)
      new(args).call
    end
  end

  def initialize(path_to_folder)
    @path_to_folder = path_to_folder
  end

  def call
    result = {}

    parse_yaml_files(result)
    parse_yaml_erb_files(result)

    result
  end

  private

  def parse_yaml_files(hash)
    yaml_files = Dir.glob(File.join(@path_to_folder, "/**/*.yml"))

    yaml_files.each do |yaml_file|
      hash.deep_merge!(YAML.load(File.read(yaml_file)))
    end
  end

  def parse_yaml_erb_files(hash)
    yaml_files = Dir.glob(File.join(@path_to_folder, "/**/*.yml.erb"))

    yaml_files.each do |yaml_erb_file|
      hash.deep_merge!(YAML.load(ERB.new(File.read(yaml_erb_file)).result))
    end
  end
end
