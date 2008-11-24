require File.join(File.dirname(__FILE__) + "/spec_helper")

describe Range do
    
  describe "to_random_i" do
    it "should be a method" do
      Range.instance_methods.should include("to_random_i")
    end
    
    it "should return a random number from the range" do
      # First check with an absolute
      result = (3..3).to_random_i
      result.should be_a_kind_of(Fixnum)
      result.should == 3
      
      # And then one that is random
      res = (3..5).to_random_i
      res.should be_a_kind_of(Fixnum)
      [3,4,5].should include(res)
    end
  end
  
  describe "random_letters" do
    it "should be a method" do
      Range.instance_methods.should include("random_letters")
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
      Range.instance_methods.should include("random_numbers")
      (0..1).should respond_to(:random_numbers)
    end
    
    it "should generate a string of random numbers" do
      setup_range
      
      str = @range.random_numbers
      str.length.should == 4
      str.should match( /^[0-9]+$/ )
    end
  end
  
  describe "random_letters" do
    it "should be a method" do
      Range.instance_methods.should include("random_characters")
      (0..1).should respond_to(:random_characters)
    end
    
    it "should generate a string of random letters" do
      setup_range
      
      str = @range.random_characters
      str.length.should == 4
      str.should match( /^[a-z0-9]+$/ )
    end
  end
  
  def setup_range
    @range = (3..5)
    @range.should_receive(:to_random_i).and_return(4)
  end
end
