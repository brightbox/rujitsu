require File.join(File.dirname(__FILE__) + "/spec_helper")
require 'timecop'

describe Date do
  describe 'start_of_this_month' do
    it 'should return correct month number' do
      Timecop.freeze Time.local(2017, 5, 15) do
        this_month = Date.start_of_this_month
        expect(this_month).to eq(Date.new(2017, 5, 1))
      end
    end
  end

  describe 'start_of_next_month' do 
    it 'should return correct month number' do
      Timecop.freeze Time.local(2017, 5, 15) do
        next_month = Date.start_of_next_month
        expect(next_month).to eq(Date.new(2017, 6, 1))
      end
    end

    it 'should return correct month number in december' do
      Timecop.freeze Time.local(2017, 12, 15) do
        next_month = Date.start_of_next_month
        expect(next_month).to eq(Date.new(2018, 1, 1))
      end
    end
  end

  describe 'start_of_last_month' do 
    it 'should return correct month number' do
      Timecop.freeze Time.local(2017, 5, 15) do
        last_month = Date.start_of_last_month
        expect(last_month).to eq(Date.new(2017, 4, 1))
      end
    end

    it 'should return correct month number in january' do 
      Timecop.freeze Time.local(2018, 1, 15) do
        last_month = Date.start_of_last_month
        expect(last_month).to eq(Date.new(2017, 12, 1))
      end
    end
  end
  
end
