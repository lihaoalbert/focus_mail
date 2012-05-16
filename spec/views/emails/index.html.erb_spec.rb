require 'spec_helper'

describe "emails/index" do
  before(:each) do
    assign(:emails, [
      stub_model(Email,
        :body => "MyText",
        :template_id => 1,
        :template_entries => "MyText"
      ),
      stub_model(Email,
        :body => "MyText",
        :template_id => 1,
        :template_entries => "MyText"
      )
    ])
  end

  it "renders a list of emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
