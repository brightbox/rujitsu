# encoding: utf-8

require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Range do
  describe "to_random_i" do
    it "should be a method" do
      (0..1).should respond_to(:to_random_i)
    end

    it "should return a random number from the range" do
      setup_range

      # First check with an absolute
      result = @range.to_random_i
      result.should be_a_kind_of(Integer)
      result.should == 4

      # And then one that is random
      res = (3..5).to_random_i
      res.should be_a_kind_of(Integer)
      [3,4,5].should include(res)
    end
  end

  describe "random_letters" do
    it "should be a method" do
      (0..1).should respond_to(:random_letters)
    end

    it "should generate a string of random letters" do
      setup_range

      str = @range.random_letters
      str.length.should == 4
      str.should match( /^[a-z]+$/ )
    end
  end

  describe "random_numbers" do
    it "should be a method" do
      (0..1).should respond_to(:random_numbers)
    end

    it "should generate a string of random numbers" do
      setup_range

      str = @range.random_numbers
      str.length.should == 4
      str.should match( /^[0-9]+$/ )
    end

    it "should contain only the number 5 upwards" do
      setup_range

      str = @range.random_numbers :from => 5
      str.should be_a_kind_of(String)

      string_to_integers(str).each do |i|
        i.should be_a_kind_of(Integer)
        i.should >= 5
      end
    end

    it "should contain only the number 5 downwards" do
      setup_range

      str = @range.random_numbers :to => 5
      str.should be_a_kind_of(String)

      string_to_integers(str).each do |i|
        i.should be_a_kind_of(Integer)
        i.should <= 5
      end
    end

    it "should contain only numbers between 4 and 6" do
      setup_range

      str = @range.random_numbers :from => 4, :to => 6
      str.should be_a_kind_of(String)

      string_to_integers(str).each do |i|
        i.should be_a_kind_of(Integer)
        i.should >= 4
        i.should <= 6
      end
    end

    it "should create an even number" do
      setup_range

      str = @range.random_numbers :only => :even

      str.should be_a_kind_of(String)
      (str.to_i % 2).should == 0
    end

    it "should create an odd number" do
      setup_range

      str = @range.random_numbers :only => :odd

      str.should be_a_kind_of(String)
      (str.to_i % 2).should_not == 0
    end

    private

    def string_to_integers(str)
      str.split("").map {|x| x.to_i }
    end
  end

  describe "random_letters" do
    it "should be a method" do
      (0..1).should respond_to(:random_characters)
    end

    it "should generate a string of random letters" do
      setup_range

      str = @range.random_characters
      str.length.should == 4
      str.should match( /^[a-z0-9]+$/ )
    end
  end

  describe "#random_hex_characters" do
    it "should be a method" do
      (0..1).should respond_to("random_hex_characters")
    end

    it "should generate a string of random hex characters" do
      setup_range

      str = @range.random_hex_characters
      str.length.should == 4
      str.should match(/^[a-f0-9]+$/)
    end
  end

  def setup_range
    @range = (3..5)
    @range.should_receive(:to_random_i).and_return(4)
  end
end
