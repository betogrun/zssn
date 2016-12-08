require "rails_helper"

RSpec.describe LocationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survivors/1/locations").to route_to("locations#index", :survivor_id => "1" )
    end


    it "routes to #show" do
      expect(:get => "survivors/1/locations/1").to route_to("locations#show", :id => "1", :survivor_id => "1" )
    end


    it "routes to #create" do
      expect(:post => "survivors/1/locations").to route_to("locations#create", :survivor_id => "1" )
    end

    it "routes to #update via PUT" do
      expect(:put => "survivors/1/locations/1").to route_to("locations#update", :id => "1", :survivor_id => "1" )
    end

    it "routes to #destroy" do
      expect(:delete => "survivors/1/locations/1").to route_to("locations#destroy", :id => "1", :survivor_id => "1" )
    end

  end
end
