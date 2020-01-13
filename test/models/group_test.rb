require "test_helper"

describe Group do

  describe 'relations' do
    it "has members" do
      group = groups(:mcgilvra)
      group.members.length.must_equal 2
    end
    it "can add members" do
      group = Group.create(name: "madrona")
      member = Member.create(email: "me@ada.com")
      relationship = Relationship.create(group_id: group.id, member_id: member.id, status: "regular")
      group.members.first.id = member.id
    end
  end

  #custom methods
  describe "owner" do
    group = groups(:mcgilvra)
    group.owner.must_equal members(:becca)
  end
end
