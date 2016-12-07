class Location < ApplicationRecord
  belongs_to :survivor

  validates_format_of :lat, :with => /\s*[-+]?\d+\.\d+/
  validates_format_of :lon, :with => /s?[-+]?\d+\.\d+\s*/
end
