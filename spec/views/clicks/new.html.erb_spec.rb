require 'spec_helper'

describe "clicks/new" do
  before(:each) do
    assign(:click, stub_model(Click,
      :member_id => 1,
      :campaign_id => 1,
      :link_id => 1
    ).as_new_record)
  end

  it "renders new click form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clicks_path, :method => "post" do
      assert_select "input#click_member_id", :name => "click[member_id]"
      assert_select "input#click_campaign_id", :name => "click[campaign_id]"
      assert_select "input#click_link_id", :name => "click[link_id]"
    end
  end
end
