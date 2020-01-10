class Member < ApplicationRecord
  has_many :relationships
  has_many :groups, through: :relationships
  has_many :items

  validates :email,:username,:last,:first, presence: true
end
