# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name "MyString"
    from_name "MyString"
    from_email "MyString"
    subject "MyString"
    email_id 1
  end
end
