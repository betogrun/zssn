class Denouncement < ApplicationRecord
  belongs_to :survivor
  belongs_to :denounced, class_name: 'Survivor'

  after_create :increment_complaints_counter

  def increment_complaints_counter
    denounced = Survivor.find(denounced_id).increment_complaints
  end
end
