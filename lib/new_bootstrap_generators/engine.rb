# frozen_string_literal: true

module NewBootstrapGenerators
  class Engine < ::Rails::Engine
    isolate_namespace NewBootstrapGenerators
    config.app_middleware.insert_before(0, Rack::Static, urls: ['/new_bootstrap_generators-packs'],
                                                         root: NewBootstrapGenerators::Engine.root.join('public').to_s)
  end
end
