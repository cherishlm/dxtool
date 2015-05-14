require 'sinatra'
require 'active_record'
require 'rack-flash'
require 'erubis'
require 'sinatra/content_for'

ENV['RACK_ENV'] ||= "development"
set :bind,'0.0.0.0'
enable :sessions
use Rack::Flash

ActiveRecord::Base.establish_connection YAML::load(File.open('db/config.yml'))[ENV["RACK_ENV"]]

set :public_folder, File.dirname(__FILE__) + '/public'

%w{lib models controllers}.each do |dir|
  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
    require file
  end
end
