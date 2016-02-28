lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_korean/version'

Gem::Specification.new do |spec|
  spec.name          = "twitter-korean-text-ruby"
  spec.version       = TwitterKorean::VERSION
  spec.authors       = ["keepcosmos"]
  spec.email         = ["keepcosmos@gmail.com"]

  spec.summary       = "Ruby interface to Twitter Korean Text(written in Scala)"
  spec.description   = "Ruby interface to Twitter Korean Text(written in Scala)"
  spec.homepage      = 'https://github.com/keepcosmos/twitter-korean-text-ruby'
  spec.license       = "Apache License 2.0"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rjb", "~> 1.5"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "minitest", "~> 5.0"
end
