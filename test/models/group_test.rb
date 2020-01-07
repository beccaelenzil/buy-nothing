require "test_helper"

describe Group do
  describe 'relations' do
    it "has members" do
        group = groups(:mcgilvra)
        members = group.members
        members.length.must_equal 2
    end
  
      it "can set a member" do
        book = Book.new(title: "test book")
        book.author = authors(:metz)
        book.author_id.must_equal authors(:metz).id
      end
    end
end
