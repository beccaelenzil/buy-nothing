class Group < ApplicationRecord
  has_many :relationships
  has_many :members, through: :relationships

  def owner
    relationship = Relationship.find_by(group_id: self.id, status: "owner")
    member = Member.find(relationship.member_id)
    return member
  end
end
