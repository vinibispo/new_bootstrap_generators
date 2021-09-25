require 'webpacker/helper'

module NewBootstrapGenerators
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      MyEngine.webpacker
    end
  end
end
