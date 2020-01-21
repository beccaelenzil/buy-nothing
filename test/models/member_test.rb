require "test_helper"
require 'pry'

describe Member do

  describe 'relations' do
    it "belongs to a group" do
      member = members(:becca)
      member.groups.must_include groups(:mcgilvra)
      member.groups.must_include groups(:madrona)
    end
    it "can join a group" do
      group = groups(:bush)
      member = members(:viva)
      Relationship.create(group_id: group.id, member_id: member.id, status: "regular")
      member.groups.must_include group
    end

  end
end