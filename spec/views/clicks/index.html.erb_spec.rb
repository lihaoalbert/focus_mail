require 'spec_helper'

describe "clicks/index" do
  before(:each) do
    assign(:clicks, [
      stub_model(Click,
        :member_id => 1,
        :campaign_id => 2,
        :link_id => 3
      ),
      stub_model(Click,
        :member_id => 1,
        :campaign_id => 2,
        :link_id => 3
      )
    ])
  end

  it "renders a list of clicks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
