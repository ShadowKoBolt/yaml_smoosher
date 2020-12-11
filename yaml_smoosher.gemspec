require_relative 'lib/yaml_smoosher'

Gem::Specification.new do |spec|
  spec.name          = "yaml_smoosher"
  spec.version       = YamlSmoosher::VERSION
  spec.authors       = ["Nick Bolt"]
  spec.email         = ["bolt.shadow@gmail.com"]

  spec.summary       = %q{Parse a folder of yaml files into a single hash}
  spec.homepage      = "https://github.com/ShadowKoBolt/yaml_smoosher"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ShadowKoBolt/yaml_smoosher"
  spec.metadata["changelog_uri"] = "https://github.com/ShadowKoBolt/yaml_smoosher"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "pry", "~> 0.13"

  spec.add_runtime_dependency "deep_merge", "~> 1.2"
end
