require 'spec_helper'

describe "clicks/edit" do
  before(:each) do
    @click = assign(:click, stub_model(Click,
      :member_id => 1,
      :campaign_id => 1,
      :link_id => 1
    ))
  end

  it "renders the edit click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clicks_path(@click), :method => "post" do
      assert_select "input#click_member_id", :name => "click[member_id]"
      assert_select "input#click_campaign_id", :name => "click[campaign_id]"
      assert_select "input#click_link_id", :name => "click[link_id]"
    end
  end
end
