require 'spec_helper'

describe "template_entries/edit" do
  before(:each) do
    @template_entry = assign(:template_entry, stub_model(TemplateEntry,
      :template_id => 1,
      :type => "",
      :key => "MyString",
      :default_value => "MyString"
    ))
  end

  it "renders the edit template_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => template_entries_path(@template_entry), :method => "post" do
      assert_select "input#template_entry_template_id", :name => "template_entry[template_id]"
      assert_select "input#template_entry_type", :name => "template_entry[type]"
      assert_select "input#template_entry_key", :name => "template_entry[key]"
      assert_select "input#template_entry_default_value", :name => "template_entry[default_value]"
    end
  end
end
