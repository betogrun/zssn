class Survivor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :items
  has_one :location
  has_and_belongs_to_many :accusers, class_name: 'Survivor', join_table: :indictments, foreign_key: :indicted_id, indictments_foreign_key: :accuser_id
  has_and_belongs_to_many :indicteds, class_name: 'Survivor', join_table: :indictments, foreign_key: :accuser_id, indictments_foreign_key: :indicted_id

  attr_accessor :complaints, :is_infected

  def increment_complaints
    @complaints += 1
    if @complaints >= 3
      @is_infected = true
    end
  end
end
