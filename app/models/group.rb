class Group < ApplicationRecord
  has_many :relationships
  has_many :members, through: :relationships
end
