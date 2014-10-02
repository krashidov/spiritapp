require 'rails_helper'

RSpec.describe "Careplans", :type => :request do
  describe "GET /careplans" do
    it "works! (now write some real specs)" do
      get careplans_path
      expect(response.status).to be(200)
    end
  end
end
