# frozen_string_literal: true

module NewBootstrapGenerators
  module NewBootstrapGenerators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Full Installation of new_bootstrap_generators'

      def copy_layout_file
        copy_file 'layouts/starter.html.erb', 'app/views/layouts/application.html.erb'
      end

      def copy_scaffold_files
        copy_dir 'erb/scaffold', 'lib/templates/erb/scaffold'
      end
    end
  end
end
