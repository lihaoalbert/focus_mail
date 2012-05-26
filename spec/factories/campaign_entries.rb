# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign_entry do
    campaign_id 1
    entry_id 1
    value "MyString"
  end
end
