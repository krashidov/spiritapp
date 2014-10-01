require 'rails_helper'
require 'spec_helper'

RSpec.describe "Authentication", :type => :request do
  describe "when logged in" do
    include_context "Authorize User"
    before(:all) do
      @tokens = get_authenticated_user_tokens
    end

    it "sign in should be fine" do
      expect(response.status).to be(200)
    end

    it "should sign out" do
      delete destroy_user_session_path ,nil, @tokens
      expect(response.status).to be(200)
    end
  end
end
