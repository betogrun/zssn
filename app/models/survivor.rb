class Survivor < ApplicationRecord
  enum gender: [:male, :female]

  has_one :location
end
