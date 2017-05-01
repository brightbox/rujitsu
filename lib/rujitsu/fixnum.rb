# encoding: utf-8

module RujitsuFixnum
  # produce a string of N random vowels
  def random_vowels opts={}
    generate_random_string_using VOWELS, opts
  end
  alias_method :random_vowel, :random_vowels

  # produce a string of N random consonants
  def random_consonants opts={}
    generate_random_string_using CONSONANTS, opts
  end
  alias_method :random_consonant, :random_consonants

  # produce a string of N random letters
  #   5.random_letters
  def random_letters opts={}
    generate_random_string_using LETTERS, opts
  end
  alias_method :random_letter, :random_letters

  # produce a string of N random numbers
  #   5.random_numbers
  # optionally specific limits on the numbers
  #   5.random_numbers(:from => 1, :to => 5)
  def random_numbers( opts = {} )
    # Then set some defaults, just in case
    upper = opts[:to] || 9
    lower = opts[:from] || 0
    only = opts[:only] || :both

    # And finally calculate the number
    n = []
    (self - 1).times do
      i = (lower..upper).to_a.sort_by { rand }.first
      n << i.to_s
    end
    # add the last digit according to :only
    n << end_number_choices(only).select {|x| (lower <= x) && (x <= upper) }.sort_by { rand }.first.to_s
    n.join("")
  end
  alias_method :random_number, :random_numbers

  # produce a string of N random characters
  #   5.random_characters
  def random_characters opts={}
    generate_random_string_using CHARACTERS, opts
  end
  alias_method :random_character, :random_characters

  def random_hex_characters opts={}
    generate_random_string_using HEX_CHARACTERS, opts
  end
  alias_method :random_hex_character, :random_hex_characters

  private

  VOWELS = %w(a e i o u)
  LETTERS = ('a'..'z').to_a
  CONSONANTS = LETTERS - VOWELS
  NUMBERS = ('0'..'9').to_a
  CHARACTERS = LETTERS + NUMBERS
  EVENS = %w(0 2 4 6 8).map {|x| x.to_i }
  ODDS = %w(1 3 5 7 9).map {|x| x.to_i }
  HEX_CHARACTERS = NUMBERS | ('a'..'f').to_a

  def generate_random_string_using(legal_characters, opts={})
    # Check if we have anything to exclude from the legal_characters
    if (chars = opts[:except])
      # Make sure we can iterate over it
      chars = [chars] unless chars.respond_to?(:each)
      # Run through them all and remove them
      chars.each do | char |
        legal_characters.delete(char)
      end
    end

    upper_limit = legal_characters.size - 1

    srand # seed rand
    (1..self).collect do |num|
      legal_characters[rand(upper_limit)]
    end.join
  end

  def end_number_choices opt
    case opt
    when :even
      EVENS
    when :odd
      ODDS
    else
      EVENS | ODDS
    end
  end
end

Fixnum.send(:include, RujitsuFixnum)
