require 'spec_helper'

describe "campaigns/index" do
  before(:each) do
    assign(:campaigns, [
      stub_model(Campaign,
        :name => "Name",
        :from_name => "From Name",
        :from_email => "From Email",
        :subject => "Subject",
        :email_id => 1
      ),
      stub_model(Campaign,
        :name => "Name",
        :from_name => "From Name",
        :from_email => "From Email",
        :subject => "Subject",
        :email_id => 1
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "From Name".to_s, :count => 2
    assert_select "tr>td", :text => "From Email".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
