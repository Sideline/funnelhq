# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Useful for clearing out Mongodb

def empty_database!
  puts 'EMPTY THE MONGODB DATABASE'
  Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
end

def create_user name, email, password
  puts 'SETTING UP DEFAULT USER LOGIN'
  user = User.create! :name => name, :email => email, :password => password, :password_confirmation => password
  puts 'New user created: ' << user.name
end

def create_project name, description
  
end

empty_database!
create_user('Owain Lewis', 'owain@owainlewis.com', 'testing')
