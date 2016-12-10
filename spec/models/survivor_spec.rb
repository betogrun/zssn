require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe "when complaints counters is greater or equals 3" do
    it "suvivor must be marked as infected" do
      denounced = FactoryGirl.create(:survivor, name:"Oscar", complaints: 2)
      denounced.increment_complaints
      denounced.save
      expect(denounced.is_infected).to be true
    end
  end
end
