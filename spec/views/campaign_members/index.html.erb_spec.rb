require 'spec_helper'

describe "campaign_members/index" do
  before(:each) do
    assign(:campaign_members, [
      stub_model(CampaignMember,
        :campaign_id => 1,
        :member_id => "Member"
      ),
      stub_model(CampaignMember,
        :campaign_id => 1,
        :member_id => "Member"
      )
    ])
  end

  it "renders a list of campaign_members" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Member".to_s, :count => 2
  end
end
