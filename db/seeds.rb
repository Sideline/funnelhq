# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Useful for clearing out Mongodb

def empty_database!
  puts 'EMPTY THE MONGODB DATABASE'
  Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
end

def create_user first_name, last_name, email, password
  puts 'SETTING UP DEFAULT USER LOGIN'
  user = User.create! :first_name => first_name, :last_name => last_name, :email => email, :password => password, :password_confirmation => password
  puts 'New user created: ' << user.email
end

def create_random_project title, description
  puts 'CREATING PROJECT'
  project = User.last.projects.create! :title => title, :description => description
  puts 'Project created'
end

def create_random_client name, email, phone
  puts 'CREATING CLIENT'
  name_array = name.split(/\s/)
  first = name_array.first
  last = name_array.last
  project = User.last.clients.create! :first_name => first, :last_name => last, :email => email, :telephone => phone
  puts 'Client created'
end

# Drop all data in the database
empty_database!

# Add a default user
create_user('Owain', 'Lewis', 'admin@test.com', 'testing')

create_random_client 'John Doe', 'jdoe@test.com', '07846123456'
create_random_client 'Steve Jobs', 'steve@apple.com', '07846345123'

create_random_project 'Build new website', 'My test project. Build a new website for Nike'
create_random_project 'Learn Scala', 'Learn to program in Scala'

