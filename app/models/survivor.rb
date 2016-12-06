class Survivor < ApplicationRecord
  enum gender: [:male, :female]
end
