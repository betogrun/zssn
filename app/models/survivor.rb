class Survivor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :items
  has_one :location

  attr_accessor :complaints, :is_infected

  def increment_complaints
    @complaints += 1
    if @complaints >= 3
      @is_infected = true
    end
  end
end
