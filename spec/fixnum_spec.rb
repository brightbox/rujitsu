require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Fixnum do

  describe "random_vowels" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_vowels")
      5.should respond_to(:random_vowels)
    end

    it "should be alias'd as random_vowel" do
      Fixnum.instance_methods.should include("random_vowel")
      5.should respond_to(:random_vowel)
    end

    it "should produce a string of random vowels" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_vowels
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[aeiou]+$/ )
      end
    end
    
    it "should exclude a character" do
      # Given there are 5 vowels, 5^3 should 
      # contain at least one instance of every vowel
      str = (5**3).random_vowels(:except => "a")
      str.should be_a_kind_of( String )
      str.length.should == 5**3
      str.should_not match(/a/)
    end
    
    it "should exclude characters" do
      str = (5**3).random_vowels(:except => %w(i o u))
      str.should be_a_kind_of( String )
      str.length.should == 5**3
      str.should_not match(/iou/)
    end
  end

  describe "random_consonants" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_consonants")
      5.should respond_to(:random_consonants)
    end

    it "should be alias'd as random_consonant" do
      Fixnum.instance_methods.should include("random_consonant")
      5.should respond_to(:random_consonant)
    end

    it "should produce a string of random consonants" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_consonants
        
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[bcdfghjklmnpqrstvwxyz]+$/ )
      end
    end
    
    it "should exclude a character" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_consonants(:except => "c")
      
      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/c/)
    end
    
    it "should exclude characters" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_consonants(:except => %w(c d f))
      
      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/cdf/)
    end
  end

  describe "random_letters" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_letters")
      5.should respond_to(:random_letters)
    end

    it "should be alias'd as random_letter" do
      Fixnum.instance_methods.should include("random_letter")
      5.should respond_to(:random_letter)
    end

    it "should produce a string of random letters" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_letters
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[a-z]+$/ )
      end
    end
    
    it "should exclude a character" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_letters(:except => "d")
      
      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/d/)
    end
    
    it "should exclude characters" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_letters(:except => %w(c d f))
      
      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/cdf/)
    end
  end

  describe "random_numbers" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_numbers")
      5.should respond_to(:random_numbers)
    end

    it "should be alias'd as random_number" do
      Fixnum.instance_methods.should include("random_number")
      5.should respond_to(:random_number)
    end

    it "should produce a string of random numbers" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        num = i.random_numbers
        num.should be_a_kind_of( String )
        num.length.should == i
        num.should match( /^[0-9]+$/ )
      end
    end
    
    it "should contain only the number 5 upwards" do
      num = 5.random_numbers(:from => 5)
      
      num.should be_a_kind_of(String)
      
      # Check each digit is greater than or equal to 5
      string_to_integers(num).each do |i|
        i.should be_a_kind_of(Integer)
        i.should >= 5
      end
    end
    
    it "should contain on the number 5 downwards" do
      num = 5.random_numbers(:to => 5)
      
      num.should be_a_kind_of(String)
      
      # Check each digit is lower than or equal to 5
      string_to_integers(num).each do |i|
        i.should be_a_kind_of(Integer)
        i.should <= 5
      end
    end
    
    it "should contain numbers between 4 and 6" do
      num = 5.random_numbers(:from => 4, :to => 6)
      
      num.should be_a_kind_of(String)
      
      # Check each digit is lower than or equal to 4..
      # ..and greater than or equal to 6
      string_to_integers(num).each do |i|
        i.should be_a_kind_of(Integer)
        i.should >= 4
        i.should <= 6
      end
    end
    
    it "should create an even number" do
      num = 5.random_numbers(:only => :even)
      
      num.should be_a_kind_of(String)
      (num.to_i % 2).should == 0
    end
    
    it "should create an odd number" do
      num = 5.random_numbers(:only => :odd)
      
      num.should be_a_kind_of(String)
      (num.to_i % 2).should_not == 0
    end
    
    private
    
    def string_to_integers(str)
      str.split("").map {|x| x.to_i }
    end
  end

  describe "random_characters" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_characters")
      5.should respond_to(:random_numbers)
    end

    it "should be alias'd as random_character" do
      Fixnum.instance_methods.should include("random_character")
      5.should respond_to(:random_character)
    end

    it "should produce a string of random letters and numbers" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_characters
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[a-z0-9]+$/ )
      end
    end
    
    
    it "should exclude a character" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_characters(:except => "c")
      
      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/c/)
    end
    
    
    it "should exclude characters" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_characters(:except => %w(c d f))
      
      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/cdf/)
    end
  end


  describe "random_hex_characters" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_hex_characters")
      5.should respond_to(:random_hex_character)
    end

    it "should be alias'd as random_hex_character" do
      Fixnum.instance_methods.should include("random_hex_character")
      5.should respond_to(:random_hex_character)
    end

    it "should produce a string of random hex characters" do
      [ 5, 10, 15, 25, 29, (26**2) ].each do |i|
        str = i.random_hex_characters
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[a-f0-9]+$/ )
      end
    end

    it "should exclude a character" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_hex_characters(:except => "c")

      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/c/)
    end

    it "should exclude characters" do
      # 26^5 should be large enough to get at least one
      # instance of every character.
      str = (26**2).random_hex_characters(:except => %w(c d f))

      str.should be_a_kind_of( String )
      str.length.should == (26**2)
      str.should_not match(/cdf/)
    end
  end

end
