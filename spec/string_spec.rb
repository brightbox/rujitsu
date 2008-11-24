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