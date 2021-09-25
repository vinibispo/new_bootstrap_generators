Rails.application.routes.draw do
  mount NewBootstrapGenerators::Engine => "/new_bootstrap_generators"
end
