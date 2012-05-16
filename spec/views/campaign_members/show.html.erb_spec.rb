require 'spec_helper'

describe "campaign_members/show" do
  before(:each) do
    @campaign_member = assign(:campaign_member, stub_model(CampaignMember,
      :campaign_id => 1,
      :member_id => "Member"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Member/)
  end
end
