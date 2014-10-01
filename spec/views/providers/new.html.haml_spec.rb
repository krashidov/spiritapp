require 'rails_helper'

RSpec.describe "providers/new", :type => :view do
  before(:each) do
    assign(:provider, Provider.new())
  end

  it "renders new provider form" do
    render

    assert_select "form[action=?][method=?]", providers_path, "post" do
    end
  end
end
