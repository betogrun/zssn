require 'rails_helper'

RSpec.describe Survivor, type: :model do
  describe "when complaints counters is greater or equals 3" do
    it "suvivor must be marked as infected" do
      accuser = FactoryGirl.create(:survivor)
      indicted = FactoryGirl.create(:survivor, complaints: 2)
      accuser.increment_complaints indicted
      expect(indicted.is_infected).to be true
  end
  end
end
