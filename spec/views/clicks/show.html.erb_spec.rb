require 'spec_helper'

describe "clicks/show" do
  before(:each) do
    @click = assign(:click, stub_model(Click,
      :member_id => 1,
      :campaign_id => 2,
      :link_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
