class Survivor < ApplicationRecord
  enum gender: [:male, :female]
  has_many :items
  has_one :location
  has_many :denouncements
  has_many :denounceds, through: :denouncements

  before_save :update_infected_status, if: :complaints_changed?

  def update_infected_status
    self.is_infected = true if self.complaints >= 3
  end

  def increment_complaints
    self.complaints += 1
  end

end
