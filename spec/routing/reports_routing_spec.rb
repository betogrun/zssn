require "rails_helper"

RSpec.describe ReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/reports").to route_to("reports#index")
    end

    it "routes to #show" do
      expect(:get => "/reports/1").to route_to("reports#show", :id => "1")
    end

  end
end
