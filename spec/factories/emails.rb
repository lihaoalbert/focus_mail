# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email do
    body "MyText"
    template_id 1
    template_entries "MyText"
  end
end
