class Item < ApplicationRecord
  enum kind: [:water, :food, :medicine, :ammo]
  belongs_to :survivor
end
