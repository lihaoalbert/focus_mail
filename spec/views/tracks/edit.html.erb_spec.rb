require 'spec_helper'

describe "tracks/edit" do
  before(:each) do
    @track = assign(:track, stub_model(Track,
      :member_id => 1,
      :campaign_id => 1
    ))
  end

  it "renders the edit track form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tracks_path(@track), :method => "post" do
      assert_select "input#track_member_id", :name => "track[member_id]"
      assert_select "input#track_campaign_id", :name => "track[campaign_id]"
    end
  end
end
