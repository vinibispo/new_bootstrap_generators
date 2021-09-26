# frozen_string_literal: true

require 'rails/generators'

module NewBootstrapGenerators
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Full Installation of new_bootstrap_generators'

      # def create_layout
      #   template 'layouts/starter.html.erb', 'app/views/layouts/application.html.erb'
      # end

      def copy_scaffold_files
        empty_directory File.join('lib', 'templates')
        empty_directory File.join('lib/templates/erb')
        empty_directory File.join('lib/templates/erb/scaffold')

        available_views.each do |view|
          copy_file "erb/scaffold/#{view}.html.erb", File.join('lib/templates/erb/scaffold', "#{view}.html.erb")
        end
      end

      private

      def available_views
        %w[index edit show new _form]
      end
    end
  end
end
