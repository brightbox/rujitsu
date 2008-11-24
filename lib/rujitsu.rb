class Numeric
  # convert float values to "cents"
  #   my_value = 2.5
  #   my_value.to_cents # => 250
  def to_cents
    (self * 100.0).to_i
  end
end

class Fixnum
  #Êproduce a string of N random letters
  #   5.random_letters
  def random_letters
    generate_random_string_using LETTERS
  end
  # produce a string of N random numbers
  #   5.random_numbers
  def random_numbers
    generate_random_string_using NUMBERS
  end
  # produce a string of N random characters
  #   5.random_characters
  def random_characters
    generate_random_string_using CHARACTERS
  end
  
  private
  
  LETTERS = ('a'..'z').to_a
  NUMBERS = ('0'..'9').to_a
  CHARACTERS = LETTERS + NUMBERS

  def generate_random_string_using(legal_characters)
    upper_limit = legal_characters.size - 1
    (1..self).collect do |num|
      legal_characters[rand(upper_limit)]
    end.join
  end
end


class Range
  #Êpull a random element out of this range
	def to_random_i
		self.to_a.sort_by { rand }.first
	end
	
	# create a string of random letters whose length is one of the values in your range
	#Ê  (3..4).random_letters #Ê=> returns a string or 3 or 4 random letters
	def random_letters
		self.to_random_i.random_letters
	end
	
	# create a string of random numbers whose length is one of the values in your range
	#Ê  (3..4).random_numbers #Ê=> returns a string or 3 or 4 random numbers
	def random_numbers
		self.to_random_i.random_numbers
	end
	
	# create a string of random characters whose length is one of the values in your range
	#Ê  (3..4).random_characters #Ê=> returns a string or 3 or 4 random characters
	def random_characters
		self.to_random_i.random_characters
	end
	
end


class String
	# Return a string that can be used as part of a url
	def to_url
		self.downcase.gsub(/[^\-0-9a-z ]/, '').split.join('-')
	end
end
