module RujitsuRange
  # pull a random element out of this range
	def to_random_i
		self.to_a.sort_by { rand }.first
	end

	# create a string of random letters whose length is one of the values in your range
	# (3..4).random_letters # => returns a string or 3 or 4 random letters
	def random_letters
		self.to_random_i.random_letters
	end

	# create a string of random numbers whose length is one of the values in your range
	# (3..4).random_numbers # => returns a string or 3 or 4 random numbers
	def random_numbers opts = {}
		self.to_random_i.random_numbers opts
	end

	# create a string of random characters whose length is one of the values in your range
	# (3..4).random_characters # => returns a string or 3 or 4 random characters
	def random_characters
		self.to_random_i.random_characters
	end

  # create a string of random hex characters whose length is one of the values in your range
  # (3..4).random_hex_characters # => returns a string of 3 or 4 random hex characters
  def random_hex_characters
    self.to_random_i.random_hex_characters
  end

end

Range.send(:include, RujitsuRange)
