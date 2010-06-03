module RujitsuString
	# Return a string that can be used as part of a url
	# replaces basic "bad" characters with "-"
	def to_url
		self.downcase.gsub(/[^\-0-9a-z ]/, '').split.join('-')
	end
	
	# Truncates a string to the specified length,
	# and appends suffix if required
	# 
	# Options:
	# * +length+ length to truncate string to. Includes the suffix in the length. Default is 50.
	# * +suffix+ suffix to append to truncated string. Pass "" or false for no suffix. Default is "...".
	# 
	def truncate opts = {}
	  opts[:length] ||= 50
	  opts[:suffix] = opts.has_key?(:suffix) ? opts[:suffix] : "..."
	  opts[:suffix] ||= ""
    opts[:length] -= (opts[:suffix].length+1)
    if opts[:length] > 0
      self.length > opts[:length] ? self[0..opts[:length]] + opts[:suffix] : self
    else
      opts[:suffix][0..(opts[:length] += opts[:suffix].length)]
    end
  end
end

String.send(:include, RujitsuString)
