require 'spec_helper'

describe Book do
  describe "size isbn of Book must be 17." do
    describe "#save" do
      [
       ["1"*17, true],
       ["1"*18, false],
      ].each do |isbn, expected|
        it "returns #{expected} if isbn size is #{isbn.size} (#{isbn.to_s})" do
          book = Book.new({:isbn => isbn})
          book.save.should == expected
        end
      end
    end
  end
end
