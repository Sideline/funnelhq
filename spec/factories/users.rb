# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.sequence :email do |n|
  "person_#{n}@example.com"
end

FactoryGirl.define do
  
  factory :user do
    first_name 'Donald'
    last_name 'Draper'
    email { Factory.next(:email) }
    password 'password'
  end
  
  factory :user_with_clients_and_projects, :parent => :user do |u|
    u.clients  { |c| [ c.association(:client)]}
    u.projects { |p| [ p.association(:project)]}
  end
  
end
