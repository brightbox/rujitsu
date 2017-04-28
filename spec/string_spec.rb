# encoding: utf-8

require File.join(File.dirname(__FILE__) + "/spec_helper")

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

describe String, "truncate" do
  
  it "should return shorter string unmodified with no params" do
    str = 30.random_characters
    # default length is 50
    str.truncate.should == str
  end
  
  it "should return shorter string unmodified with length param" do
    str = "0123456789" # length 10
    trunced = str.truncate(:length => 30)
    trunced.length.should == 10
    trunced.should == str
  end
  
  it "should return shorter string unmodified with suffix param" do
    str = "0123456789" # length 10
    trunced = str.truncate(:suffix => "abcd")
    trunced.length.should == 10
    trunced.should == str
  end
  
  it "should return shorter string unmodified with length and suffix params" do
    str = "0123456789" # length 10
    trunced = str.truncate(:length => 30, :suffix => "abcd")
    trunced.length.should == 10
    trunced.should == str
  end
  
  it "should truncate longer string with no params" do
    str = "this is a string with a really long length just to get above 50 characters"
    # default length is 50
    # default suffix is "..."
    trunced = str.truncate
    trunced.length.should == 50
    trunced.should == "this is a string with a really long length just..."
  end

  it "should truncate longer string with length param" do
    str = "123456789123456789" # length 11
    trunced = str.truncate(:length => 10)
    trunced.length.should == 10
    trunced.should == "1234567..."
  end
  
  it "should truncate longer string with suffix param" do
    str = "this is a string with a really long length just to get above 50 characters"
    # default length is 50
    trunced = str.truncate(:suffix => "..abc")
    trunced.length.should == 50
    trunced.should == "this is a string with a really long length ju..abc"
  end
  
  it "should truncate longer string with length and suffix param" do
    str = "123456789123456789" # length 11
    trunced = str.truncate(:length => 10, :suffix => "abde")
    trunced.length.should == 10
    trunced.should == "123456abde"
  end
  
  it "should return truncated string with no suffix if suffix param is false" do
    str = "this is a string with a really long length just to get above 50 characters"
    # default length is 50
    trunced = str.truncate(:suffix => false)
    trunced.length.should == 50
    trunced.should == "this is a string with a really long length just to"
  end
  
  it "should return a string of length specified even when the suffix is longer" do
    str = "this is a string" # => 16
    suff = "this is a longer string" # => 23
    trunced = str.truncate(:suffix => suff, :length => 10)
    trunced.should == "this is a "
    trunced.length.should == 10
  end
  
end
