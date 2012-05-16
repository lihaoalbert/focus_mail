require 'spec_helper'

describe "emails/show" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :body => "MyText",
      :template_id => 1,
      :template_entries => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
