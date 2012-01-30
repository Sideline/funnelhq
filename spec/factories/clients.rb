# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    first_name "Steve"
    last_name "Jobs"
    email "steve@apple.com"
    telephone "07846123457"
  end
end
