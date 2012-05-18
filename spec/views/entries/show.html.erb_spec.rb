require 'spec_helper'

describe "entries/show" do
  before(:each) do
    @entry = assign(:entry, stub_model(Entry,
      :template_id => 1,
      :type => "Type",
      :name => "Name",
      :default_value => "Default Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Type/)
    rendered.should match(/Name/)
    rendered.should match(/Default Value/)
  end
end
