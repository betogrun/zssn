class Denouncement < ApplicationRecord
  belongs_to :survivor
  belongs_to :denounced, class_name: 'Survivor'

  before_save :increment_complaints_counter

  def increment_complaints_counter
    unless Denouncement.find_by(denounced_id: denounced.id)    
      denounced.increment_complaints
      denounced.save
    end
  end
end
