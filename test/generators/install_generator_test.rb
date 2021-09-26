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

  teardown :teardown_app

  test 'should copy scaffold erb templates' do
    run_generator [destination_root, '--force']
    %w[index edit new show _form].each do |view|
      assert_file "lib/templates/erb/scaffold/#{view}.html.erb"
    end
  end

  test 'should copy application file' do
    remove_file 'app/views/layouts/application.html.erb'
    assert_no_file 'app/views/layouts/application.html.erb'
    run_generator
    assert_file 'app/views/layouts/application.html.erb'
  end

  test 'should have package.json file' do
    run_generator [destination_root, '--force']
    assert_file 'package.json'
  end

  private

  def prepare_dummy_app
    FileUtils.cp_r('test/dummy/.', destination_root)
  end

  def remove_file(file)
    FileUtils.rm(File.join(destination_root, file)) if exist?(file)
  end

  def exist?(file)
    ::File.exist?(File.join(destination_root, file))
  end

  def teardown_app
    FileUtils.rm_rf(destination_root)
  end
end
