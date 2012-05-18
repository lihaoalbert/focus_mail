require 'spec_helper'

describe "entries/new" do
  before(:each) do
    assign(:entry, stub_model(Entry,
      :template_id => 1,
      :type => "",
      :name => "MyString",
      :default_value => "MyString"
    ).as_new_record)
  end

  it "renders new entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => entries_path, :method => "post" do
      assert_select "input#entry_template_id", :name => "entry[template_id]"
      assert_select "input#entry_type", :name => "entry[type]"
      assert_select "input#entry_name", :name => "entry[name]"
      assert_select "input#entry_default_value", :name => "entry[default_value]"
    end
  end
end
