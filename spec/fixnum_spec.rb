require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Fixnum do

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
