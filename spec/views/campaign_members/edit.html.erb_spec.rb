require 'spec_helper'

describe "campaign_members/edit" do
  before(:each) do
    @campaign_member = assign(:campaign_member, stub_model(CampaignMember,
      :campaign_id => 1,
      :member_id => "MyString"
    ))
  end

  it "renders the edit campaign_member form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => campaign_members_path(@campaign_member), :method => "post" do
      assert_select "input#campaign_member_campaign_id", :name => "campaign_member[campaign_id]"
      assert_select "input#campaign_member_member_id", :name => "campaign_member[member_id]"
    end
  end
end
