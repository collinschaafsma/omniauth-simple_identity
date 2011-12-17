require 'rubygems'
require 'bundler'
Bundler.setup :default, :development, :test

require 'simplecov'
SimpleCov.start

require 'rack/test'
require 'omniauth/simple_identity'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

