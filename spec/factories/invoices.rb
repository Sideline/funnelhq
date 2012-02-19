# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    customer_name "MyString"
    customer_email "MyString"
    customer_phone "MyString"
  end
end
