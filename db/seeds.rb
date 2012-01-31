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

# Drop all data in the database
empty_database!

# Add a default users
create_user('admin', 'admin@test.com', 'testing')
