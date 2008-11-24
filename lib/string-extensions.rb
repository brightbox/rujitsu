class String
	# Return a string that can be used as part of a url
	def to_url
		self.downcase.gsub(/[^\-0-9a-z ]/, '').split.join('-')
	end
end
