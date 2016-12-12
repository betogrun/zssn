require "rails_helper"

RSpec.describe BartersController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/barters").to route_to("barters#create")
    end


  end
end
