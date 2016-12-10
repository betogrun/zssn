require "rails_helper"

RSpec.describe DenouncementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/denouncements").to route_to("denouncements#index")
    end

    it "routes to #new" do
      expect(:get => "/denouncements/new").to route_to("denouncements#new")
    end

    it "routes to #show" do
      expect(:get => "/denouncements/1").to route_to("denouncements#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/denouncements/1/edit").to route_to("denouncements#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/denouncements").to route_to("denouncements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/denouncements/1").to route_to("denouncements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/denouncements/1").to route_to("denouncements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/denouncements/1").to route_to("denouncements#destroy", :id => "1")
    end

  end
end
