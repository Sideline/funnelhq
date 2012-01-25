# Ruby on Rails MongoDB Base Application

This app can be used as a starting point when generating new Rails 3 MongoDB apps. It brings together the following

+ RSpec
+ Haml
+ MongoDB via Mongoid
+ Devise

The app is configured for easy deployment on Heroku. A live version is running at http://rbase.herokuapp.com/

## Getting started

Clone the repo

    git clone git@github.com:owainlewis/baseapp.git [your_project_name]

Bundle your gems

    bundle

Set up the mongodb config in config/mongoid.yml

Make sure Mongodb is running

    sudo mongod

Create a default user for logging in

    rake db:seed

Run the server

    rails s thin

Running tests

    rspec spec

