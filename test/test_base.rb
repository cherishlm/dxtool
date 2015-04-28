require File.expand_path("../../site", __FILE__) 
require 'minitest/autorun'
require 'rack/test'
ENV['RACK_ENV'] = 'test'

class TestBase <Minitest::Test 
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end
end
