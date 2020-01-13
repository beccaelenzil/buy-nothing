require "test_helper"
require 'pry'

describe Member do

  describe 'relations' do
    it "belongs to a group" do
      member = members(:becca)
      member.group.must_include groups(:mcgilvra)
      member.group.must_include groups(:madrona)
    end
    it "can set the group" do
      member = Member.new(email: "me@ada.com")
      member.group = groups(:mcgilvra)
      member.groups.must_include groups(:mcgilvra)
    end
    #it "has items" do
    #  member = members(:becca)
    #  member.items.length.must_equal 4
    #end
    #it "can add items" do
    #  group = groups(:mcgilvra)
    #  member = Member.create!(email: "ve@ada.com",# group_id: group.id)
    #  item = Item.create(title: "swing", member_id: member.id)
    #  member.items.first.id.must_equal item.id
    end
  end
end
