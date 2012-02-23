# Funnel

Funnel is an open source business management tool for freelancers.

This is the open source version of the app running at funnelhq.com aimed at those who want to host this app on their own servers.

It's built with Ruby on Rails, Clojure and MongoDB.

With Funnel you can manage your entire business from one centralised location.

This project is still in development

A live version is running at http://freelancedeck.herokuapp.com

You can login with the following email and password: 

+ admin@test.com 
+ password

## Technology

This app uses 

+ MongoDB
+ Rails 3
+ Clojure
+ Amazon s3 for file storage

## Install

+ Install MongoDB
+ Set up your database config in config/mongoid.yml
+ Install dependencies

## Creating a test user

Run the following rake command to generate a test user to login

    rake db:seed

## Rake tasks

There are two important Rake tasks included with the app. The first task makes a backup of your MongoDB database

    rake db:dump

This creates a mongodump of your database in the db directory.

The second task is for deploying your app to Heroku easily. Assuming your app is already set up with Heroku you can run

    rake heroku:deploy

This command does 3 things

+ Precompiles your assets (required for Heroku)
+ Checks your app into git
+ Pushes the app up to Heroku

## License 

This software is provided free for users hosting it on their on system. 

A hosted version will be available at funnelhq.com.

