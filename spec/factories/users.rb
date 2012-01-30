# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Donald'
    last_name 'Draper'
    email 'draper@gmail.com'
    password 'password'
  end
end
