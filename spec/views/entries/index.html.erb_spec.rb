require 'spec_helper'

describe "entries/index" do
  before(:each) do
    assign(:entries, [
      stub_model(Entry,
        :template_id => 1,
        :type => "Type",
        :name => "Name",
        :default_value => "Default Value"
      ),
      stub_model(Entry,
        :template_id => 1,
        :type => "Type",
        :name => "Name",
        :default_value => "Default Value"
      )
    ])
  end

  it "renders a list of entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Default Value".to_s, :count => 2
  end
end
