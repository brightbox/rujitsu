class Fixnum
  # produce a string of N random vowels
  def random_vowels
    generate_random_string_using VOWELS
  end
  # produce a string of N random consonants
  def random_consonants
    generate_random_string_using CONSONANTS
  end
  # produce a string of N random letters
  #   5.random_letters
  def random_letters
    generate_random_string_using LETTERS
  end
  # produce a string of N random numbers
  #   5.random_numbers
  # optionally specific limits on the numbers
  #   5.random_numbers(:from => 1, :to => 5)
  def random_numbers( opts = {} )
    # Then set some defaults, just in case
    upper = opts[:to] || 9
    lower = opts[:from] || 0
            
    # And finally calculate the number
    n = []    
    self.times do
      i = (lower..upper).to_a.sort_by { rand }.first
      n << i.to_s
    end
    n.join("")
  end
  # produce a string of N random characters
  #   5.random_characters
  def random_characters
    generate_random_string_using CHARACTERS
  end
  
  private

  VOWELS = ['a', 'e', 'i', 'o', 'u']  
  LETTERS = ('a'..'z').to_a
  CONSONANTS = LETTERS - VOWELS
  NUMBERS = ('0'..'9').to_a
  CHARACTERS = LETTERS + NUMBERS

  def generate_random_string_using(legal_characters)
    upper_limit = legal_characters.size - 1
    (1..self).collect do |num|
      legal_characters[rand(upper_limit)]
    end.join
  end
end

