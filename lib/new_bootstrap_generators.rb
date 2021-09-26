# frozen_string_literal: true

require 'new_bootstrap_generators/version'
require 'new_bootstrap_generators/engine'
require 'generators/new_bootstrap_generators/install/install_generator'

module NewBootstrapGenerators
  ROOT_PATH = Pathname.new(File.join(__dir__, '..'))
  class << self
    def webpacker
      @webpacker ||= ::Webpacker::Instance.new(root_path: ROOT_PATH,
                                               config_path: ROOT_PATH.join(
                                                 'config', 'webpacker.yml'
                                               ))
    end
  end
  # Your code goes here...
end
