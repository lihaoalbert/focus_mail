require 'spec_helper'

describe "template_entries/show" do
  before(:each) do
    @template_entry = assign(:template_entry, stub_model(TemplateEntry,
      :template_id => 1,
      :type => "Type",
      :key => "Key",
      :default_value => "Default Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Type/)
    rendered.should match(/Key/)
    rendered.should match(/Default Value/)
  end
end
