require 'rails_helper'

RSpec.describe "providers/show", :type => :view do
  before(:each) do
    @provider = assign(:provider, Provider.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
