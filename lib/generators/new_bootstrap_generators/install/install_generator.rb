# frozen_string_literal: true

require 'rails/generators'

module NewBootstrapGenerators
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Full Installation of new_bootstrap_generators'

      def create_layout_file
        template 'layouts/starter.html.erb', File.join('app/views/layouts/application.html.erb')
      end

      def copy_scaffold_files
        empty_directory File.join('lib', 'templates')
        empty_directory File.join('lib/templates/erb')
        empty_directory File.join('lib/templates/erb/scaffold')

        available_views.each do |view|
          copy_file "erb/scaffold/#{view}.html.erb", File.join('lib/templates/erb/scaffold', "#{view}.html.erb")
        end
      end

      def add_yarn_dependencies
        puts destination_root
        unless File.exist?('package.json')
          say 'Verify if webpacker is installed', :green
          install_webpacker if gemfile_exists?
        end
        install_bootstrap
      end

      private

      def available_views
        %w[index edit show new _form]
      end

      def gemfile_exists?
        File.exist?('Gemfile')
      end

      def gemfile_has_webpacker?
        File.read('Gemfile').include?('webpacker')
      end

      def install_webpacker
        if gemfile_has_webpacker?
          gemfile_lock = File.read('Gemfile.lock')
          if !gemfile_lock.present? || !gemfile_lock.include?('webpacker')
            say "Webpacker is not installed, so we're gonna install", :green
            run 'bundle install'
          end
        else
          add_webpacker_on_gemfile
        end
      end

      def add_webpacker_on_gemfile
        say 'Webpacker is not on Gemfile', :green
        run 'bundle add webpacker'
        run 'bundle install'
        say 'Configuring webpacker', :green
        run 'bundle exec rails generate webpacker:install'
      end

      def install_bootstrap
        say 'Install bootstrap dependencies', :green
        run 'yarn add bootstrap@^5.1.1 @popperjs/core@^2.10.1'
      end
    end
  end
end
