require 'spec_helper'

describe "campaigns/show" do
  before(:each) do
    @campaign = assign(:campaign, stub_model(Campaign,
      :name => "Name",
      :from_name => "From Name",
      :from_email => "From Email",
      :subject => "Subject",
      :email_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/From Name/)
    rendered.should match(/From Email/)
    rendered.should match(/Subject/)
    rendered.should match(/1/)
  end
end
