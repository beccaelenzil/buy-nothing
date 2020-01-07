require "test_helper"

describe Member do
  describe 'relations' do
    it "belongs to a group" do
      member = members(:becca)
      member.group_id.must_equal groups(:mcgilvra).id
    end
  
    it "can set a member" do
      book = Book.new(title: "test book")
        book.author = authors(:metz)
        book.author_id.must_equal authors(:metz).id
      end
    end
end
