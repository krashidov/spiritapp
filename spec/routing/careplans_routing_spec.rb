require "rails_helper"

RSpec.describe CareplansController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/careplans").to route_to("careplans#index")
    end

    it "routes to #new" do
      expect(:get => "/careplans/new").to route_to("careplans#new")
    end

    it "routes to #show" do
      expect(:get => "/careplans/1").to route_to("careplans#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/careplans/1/edit").to route_to("careplans#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/careplans").to route_to("careplans#create")
    end

    it "routes to #update" do
      expect(:put => "/careplans/1").to route_to("careplans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/careplans/1").to route_to("careplans#destroy", :id => "1")
    end

  end
end
