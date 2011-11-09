require 'spec_helper'

describe Book do
  describe "isbn length must be 17." do
    describe "#save" do
      [
       ["1"*17, true],
       ["1"*18, false],
      ].each do |isbn, expected|
        it "returns #{expected} if isbn length is #{isbn.size} (#{isbn.to_s})" do
          book = Book.new({:isbn => isbn})
          book.save.should == expected
        end
      end
    end
  end
  
  describe "isbn value must be presence." do
    describe "#save" do
      it "returns true when isbn is 11111111111111111. " do
        book = Book.new({:isbn => "1"*17})
        book.save.should == true
      end
      it "returns false when isbn is empty "do
        book = Book.new()
        book.save.should == false
      end
    end
  end
end

