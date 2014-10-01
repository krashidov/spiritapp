require 'rails_helper'

RSpec.describe "DefaultTasks", :type => :request do
  describe "GET /default_tasks" do
    it "works! (now write some real specs)" do
      get default_tasks_path
      expect(response.status).to be(200)
    end
  end
end
