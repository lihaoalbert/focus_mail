# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :template_entry do
    template_id 1
    type ""
    key "MyString"
    default_value "MyString"
  end
end
