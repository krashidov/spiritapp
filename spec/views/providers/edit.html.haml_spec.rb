require 'rails_helper'

RSpec.describe "providers/edit", :type => :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!())
  end

  it "renders the edit provider form" do
    render

    assert_select "form[action=?][method=?]", provider_path(@provider), "post" do
    end
  end
end
