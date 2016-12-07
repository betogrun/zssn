class Survivor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :items
  has_one :location
end
