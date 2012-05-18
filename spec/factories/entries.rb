# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    template_id 1
    type ""
    name "MyString"
    default_value "MyString"
  end
end
