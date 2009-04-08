require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('rujitsu', '0.2.5') do | config | 
  config.description = 'Various helper methods to smooth over Ruby development'
  config.url = 'http://github.com/rahoub/rujitsu'
  config.author = 'Brightbox Systems Ltd'
  config.email = 'hello@brightbox.co.uk'
  config.ignore_pattern = ['tmp/*', 'script/*']
  config.development_dependencies = []
end

desc "Generates manifest & gemspec in one go"
task :build => [:manifest, :build_gemspec]

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each do | rake_file | 
  load rake_file
end
