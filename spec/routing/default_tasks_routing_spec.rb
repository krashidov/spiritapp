require "rails_helper"

RSpec.describe DefaultTasksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/default_tasks").to route_to("default_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/default_tasks/new").to route_to("default_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/default_tasks/1").to route_to("default_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/default_tasks/1/edit").to route_to("default_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/default_tasks").to route_to("default_tasks#create")
    end

    it "routes to #update" do
      expect(:put => "/default_tasks/1").to route_to("default_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/default_tasks/1").to route_to("default_tasks#destroy", :id => "1")
    end

  end
end
