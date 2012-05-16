require 'spec_helper'

describe "emails/edit" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :body => "MyText",
      :template_id => 1,
      :template_entries => "MyText"
    ))
  end

  it "renders the edit email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emails_path(@email), :method => "post" do
      assert_select "textarea#email_body", :name => "email[body]"
      assert_select "input#email_template_id", :name => "email[template_id]"
      assert_select "textarea#email_template_entries", :name => "email[template_entries]"
    end
  end
end
