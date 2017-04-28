# encoding: utf-8

module Kernel
  # If output is true then echo's,
  # else just returns the name
  def _cmd output=false
    caller[0] =~ /`([^']*)'/
    output ? p($1) : $1
  end
  private :_cmd
end

module ExtendObject
  # Outputs all methods not inherited from Object
  def simple_methods
    self.methods.sort - Object.methods
  end

  # Matches your search string against all
  # methods and returns array
  def grep_method match
    match = /#{match}/ unless match.is_a? Regexp
    self.methods.grep(match)
  end
end
Object.send(:include, ExtendObject)
