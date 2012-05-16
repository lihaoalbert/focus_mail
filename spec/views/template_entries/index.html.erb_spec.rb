require 'spec_helper'

describe "template_entries/index" do
  before(:each) do
    assign(:template_entries, [
      stub_model(TemplateEntry,
        :template_id => 1,
        :type => "Type",
        :key => "Key",
        :default_value => "Default Value"
      ),
      stub_model(TemplateEntry,
        :template_id => 1,
        :type => "Type",
        :key => "Key",
        :default_value => "Default Value"
      )
    ])
  end

  it "renders a list of template_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Default Value".to_s, :count => 2
  end
end
