require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('rujitsu', '0.1.0') do | config | 
  config.description = 'Various helper methods to smooth over Ruby development'
  config.url = 'http://github.com/rahoub/rujitsu'
  config.author = 'Rahoul Baruah'
  config.email = 'hello@3hv.co.uk'
  config.ignore_pattern = ['tmp/*', 'script/*']
  config.development_dependencies = ['rspec >= 1.1.11']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each do | rake_file | 
  load rake_file
end
