require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe "when complaints counters is greater or equals 3" do
    it "suvivor must be marked as infected" do
      survivor = FactoryGirl.create(:survivor, complaints: 2)
      survivor.increment_complaints
      expect(survivor.is_infected).to be true
  end
  end
end
