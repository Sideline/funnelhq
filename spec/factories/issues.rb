# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    title "The website is down"
    status false
    description "Fix the website quick"
  end
end
