require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Numeric, "to_cents" do
  it "should be a method" do
    Numeric.instance_methods.should include("to_cents")
  end

  it "should convert float values to \"cents\""
end

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

describe String, "to_url" do

  it "should remove non-valid characters" do
    "a!@£$".to_url.should == "a"
  end

  it "should convert spaces to hyphens" do
    "a string".to_url.should == "a-string"
  end

  it "should downcase entire string" do
    "THISISASTRING".to_url.should == "thisisastring"
  end

  it "should not touch [\\-0-9a-z]" do
    "post-number-12345".to_url.should == "post-number-12345"
  end

end