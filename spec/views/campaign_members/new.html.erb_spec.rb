require 'spec_helper'

describe "campaign_members/new" do
  before(:each) do
    assign(:campaign_member, stub_model(CampaignMember,
      :campaign_id => 1,
      :member_id => "MyString"
    ).as_new_record)
  end

  it "renders new campaign_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => campaign_members_path, :method => "post" do
      assert_select "input#campaign_member_campaign_id", :name => "campaign_member[campaign_id]"
      assert_select "input#campaign_member_member_id", :name => "campaign_member[member_id]"
    end
  end
end
