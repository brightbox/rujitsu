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

  def generate_random_string_using legal_characters
    result = ""
    upper_limit = legal_characters.size - 1
    self.times do | num | 
      result << legal_characters[rand(upper_limit)]
    end
    return result
  end
end



