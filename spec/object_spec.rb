require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Object do
  describe "testing membership of a container" do
    it "should report whether it is in an array of objects" do
      @object = Object.new
      @positive = [@object, Object.new, Object.new]
      @negative = [Object.new, Object.new, Object.new]
      
      @object.in?(@positive).should be_true
      @object.in?(@negative).should be_false
    end

    it "should report whether it is equal if given a non-container" do
      @object = Object.new
      @another = Object.new
      
      @object.in?(@object).should be_true
      @object.in?(@another).should be_false
    end
    
    it "should not be a member of nil" do
      @object = Object.new
      @object.in?(nil).should be_false
    end
  end
end