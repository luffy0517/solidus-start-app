# frozen_string_literal: true

module SolidusStarterFrontend
  class RspecGenerator < Rails::Generators::Base
    source_root File.expand_path('../../..', __dir__)

    def install
      gem_group :development, :test do
        gem 'apparition', '~> 0.6.0'
        gem 'rails-controller-testing', '~> 1.0.5'
        gem 'rspec-activemodel-mocks', '~> 1.1.0'
        gem 'solidus_dev_support', '~> 2.5'
      end

      Bundler.with_original_env do
        run 'bundle install'
      end

      # Copy spec files
      directory 'spec/controllers'
      directory 'spec/helpers'
      directory 'spec/mailers'
      directory 'spec/requests'
      directory 'spec/support/solidus_starter_frontend'
      directory 'spec/system'
      directory 'spec/views'
      copy_file 'spec/solidus_starter_frontend_helper.rb'
    end
  end
end
