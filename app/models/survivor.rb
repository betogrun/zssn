class Survivor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :items
  has_one :location
  has_and_belongs_to_many :accusers, class_name: 'Survivor', join_table: :indictments, foreign_key: :indicted_id, indictments_foreign_key: :accuser_id
  has_and_belongs_to_many :indicteds, class_name: 'Survivor', join_table: :indictments, foreign_key: :accuser_id, indictments_foreign_key: :indicted_id

  def increment_complaints(survivor)
    survivor.complaints += 1
    if survivor.complaints >= 3
      survivor.is_infected = true
    end
  end
end
