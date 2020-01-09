class Member < ApplicationRecord
  has_and_belongs_to_many :group
  has_many :items
end
