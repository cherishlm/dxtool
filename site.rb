require 'sinatra'
require 'active_record'
require 'erb'

require 'sinatra/content_for'

ENV['RACK_ENV'] ||= "development"

ActiveRecord::Base.establish_connection YAML::load(File.open('db/config.yml'))[ENV["RACK_ENV"]]

%w{lib models controllers}.each do |dir|
  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
    require file
  end
end
