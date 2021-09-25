require_relative "lib/new_bootstrap_generators/version"

Gem::Specification.new do |spec|
  spec.name        = "new_bootstrap_generators"
  spec.version     = NewBootstrapGenerators::VERSION
  spec.authors     = ["vinibispo"]
  spec.email       = ["vini.bispo015@gmail.com"]
  spec.summary     = "Summary of NewBootstrapGenerators."
  spec.description = "Description of NewBootstrapGenerators."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.metadata["source_code_uri"] = "https://github.com/vinibispo/new_bootstrap_generators"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"
end
