require "deep_merge"
require "yaml"

class YamlSmoosher
  VERSION = "0.1.0"

  class << self
    def call(args)
      new(args).call
    end
  end

  def initialize(path_to_folder)
    @path_to_folder = path_to_folder
  end

  def call
    files = Dir.glob(File.join(@path_to_folder, "/**/*.yml"))

    result = {}

    files.each do |file|
      result.deep_merge(YAML.safe_load(File.read(file)))
    end

    result
  end
end
