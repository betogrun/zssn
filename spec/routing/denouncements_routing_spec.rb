require "rails_helper"

RSpec.describe DenouncementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survivors/1/denouncements").to route_to("denouncements#index", :survivor_id => "1" )
    end

    it "routes to #show" do
      expect(:get => "/survivors/1/denouncements/1").to route_to("denouncements#show", :id => "1", :survivor_id => "1" )
    end

    it "routes to #create" do
      expect(:post => "/survivors/1/denouncements").to route_to("denouncements#create", :survivor_id => "1")
    end

  end
end
