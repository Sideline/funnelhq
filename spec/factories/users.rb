# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'someone'
    email 'someone@gmail.com'
    password 'password'
  end
end
