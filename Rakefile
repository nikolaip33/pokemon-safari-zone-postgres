ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

ActiveSupport::Inflector.inflections do |inflect|  
    inflect.irregular 'pokemon', 'pokemon'
end

task :console do
    Pry.start
end