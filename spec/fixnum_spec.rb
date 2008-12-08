require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Fixnum do

  describe "random_vowels" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_vowels")
      5.should respond_to(:random_vowels)
    end
    
    it "should produce a string of random vowels" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_vowels
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[aeiou]+$/ )
      end
    end
  end

  describe "random_consonants" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_consonants")
      5.should respond_to(:random_consonants)
    end
    
    it "should produce a string of random consonants" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_consonants
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[bcdfghjklmnpqrstvwxyz]+$/ )
      end
    end
  end

  describe "random_letters" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_letters")
      5.should respond_to(:random_letters)
    end

    it "should produce a string of random letters" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_letters
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[a-z]+$/ )
      end
    end
  end

  describe "random_numbers" do
    it "should be a method" do
      Fixnum.instance_methods.should include("random_numbers")
      5.should respond_to(:random_numbers)
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

    it "should produce a string of random letters and numbers" do
      [ 5, 10, 15, 25, 29 ].each do |i|
        str = i.random_characters
        str.should be_a_kind_of( String )
        str.length.should == i
        str.should match( /^[a-z0-9]+$/ )
      end
    end
  end

end
