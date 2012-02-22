# Freelance Deck

FreelanceDeck is an open source business management tool for freelancers.

It's built with Ruby on Rails, Clojure and MongoDB.

With Freelance Deck you can manage your entire business from one centralised location.

This projects is still in development

A live version is running at http://freelancedeck.herokuapp.com

You can login with the following email and password: 

+ admin@test.com 
+ password

## Install

+ Install MongoDB
+ Set up your database config in config/mongoid.yml
+ Install dependencies

## Creating a test user

Run the following rake command to generate a test user to login

    rake db:seed

That will create a user with email: admin@test.com password: testing

