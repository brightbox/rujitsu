# encoding: utf-8

#
# Requires everything in rujitsu/
#
dir_path = File.dirname(__FILE__)
Dir["#{dir_path}/*.rb"].each do | file |
  next if file =~ /all.rb$/
  require file
end
