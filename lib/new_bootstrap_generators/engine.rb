# frozen_string_literal: true

module NewBootstrapGenerators
  class Engine < ::Rails::Engine
    isolate_namespace NewBootstrapGenerators
    initializer 'webpacker.proxy' do |app|
      insert_middleware = NewBootstrapGenerators.webpacker.config.dev_server.present? rescue nil
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy,
        ssl_verify_none: true,
        webpacker: NewBootstrapGenerators.webpacker
      )

      app.middleware.insert_before(0, Rack::Static, urls: ['/new_bootstrap_generators-packs'], root: NewBootstrapGenerators::Engine.root.join('public').to_s)
    end
  end
end
