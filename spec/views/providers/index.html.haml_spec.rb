require 'rails_helper'

RSpec.describe "providers/index", :type => :view do
  before(:each) do
    assign(:providers, [
      Provider.create!(),
      Provider.create!()
    ])
  end

  it "renders a list of providers" do
    render
  end
end
