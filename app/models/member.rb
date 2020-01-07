class Member < ApplicationRecord
  belongs_to :group
  has_many :items
end
