require "rails_helper"

RSpec.describe ItemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survivors/1/items").to route_to("items#index", :survivor_id => "1" )
    end

    it "routes to #show" do
      expect(:get => "/survivors/1/items/1").to route_to("items#show", :id => "1", :survivor_id => "1" )
    end

    it "routes to #create" do
      expect(:post => "/survivors/1/items").to route_to("items#create", :survivor_id => "1" )
    end

    it "routes to #update via PUT" do
      expect(:put => "/survivors/1/items/1").to route_to("items#update", :id => "1", :survivor_id => "1" )
    end

    it "routes to #destroy" do
      expect(:delete => "/survivors/1/items/1").to route_to("items#destroy", :id => "1", :survivor_id => "1" )
    end

  end
end
