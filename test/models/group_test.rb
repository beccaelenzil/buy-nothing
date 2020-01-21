require "test_helper"

describe Group do

  describe 'relations' do
    it "has members" do
      group = groups(:mcgilvra)
      group.members.length.must_equal 2
    end
    it "can add members" do
      group = groups(:bush)
      member = members(:becca)
      Relationship.create(group_id: group.id, member_id: member.id, status: "regular")
      group.members.first.must_equal member
    end
  end

  describe "custom methods" do
    it "has one owner" do
      group = groups(:mcgilvra)
      group.owner.must_equal members(:becca)
    end
  end
end
