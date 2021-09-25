require "new_bootstrap_generators/version"
require "new_bootstrap_generators/engine"

module NewBootstrapGenerators
  class << self
    def Webpacker
      @Webpacker ||= ::Webpacker::Instance.new(root_path: NewBootstrapGenerators::Engine.root, config_path: NewBootstrapGenerators::Engine.root.join('config', 'webpacker.yml'))
    end
  end
  # Your code goes here...
end
