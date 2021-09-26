# frozen_string_literal: true

require 'test_helper'
require 'generators/new_bootstrap_generators/install/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests NewBootstrapGenerators::Generators::InstallGenerator
  destination File.expand_path('../../tmp', __dir__)

  setup do
    prepare_destination
    prepare_dummy_app
  end

  test 'should copy scaffold erb templates' do
    run_generator
    %w[index edit new show _form].each do |view|
      assert_file "lib/templates/erb/scaffold/#{view}.html.erb"
    end
  end

  test 'should copy application file' do
    run_generator
    assert_file 'app/views/layouts/application.html.erb'
  end

  private

  def prepare_dummy_app
    FileUtils.cp_r('test/dummy/.', destination_root)
  end
end
