# encoding: utf-8

require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Numeric, "to_cents" do
  it "should be a method" do
    Numeric.instance_methods.should include("to_cents")
    Numeric.new.should respond_to(:to_cents)
  end

  it "should convert float values to \"cents\"" do
    [ 5, 10, 15, 25, 29 ].each do |i|
      i.to_cents.should == (i*100).to_i
    end
  end
end
