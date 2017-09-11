# Userole

Userole is an easy to use Ruby on Rails application with limited functionality for viewing and managing
Users and Roles written in response to a programming challenge.

### The Challange

> Create a simple-to-use Ruby on Rails web application to maintain user passwords and security roles each user may possess.
> It should display the list of users and roles they possess in a table.
> It should also allow the application user to change a user's password.
> We only need three roles and three users.
> The roles and passwords must be persisted to storage to be used next time the application is run.

### Quick Start

To see the application in action:

    git clone https://github.com/rio4ruby/userole
    cd userole
    bundle
    rake db:setup
    rails s

Point your browser at http://localhost:3000/

You will be presented with a login screen.

To login as an admin use the credentials:
* admin@example.com/adminadmin

To login as a normal user use the credentials:
* user@example.com/useruser

An admin can do more than a normal user, but either meets the goals of the challenge.

## Implemtation Notes

This was developed using
* Ruby v2.4.1
* Rails v5.1.4
* Sqlite3
* Ubuntu Linux v16.04

The development tools used were
* A text editor
* RVM - Ruby Version Manager
* Git for Source Code Management

#### Gems

Besides the gems included with Rails, I choose the following

* **devise** to control access to the application
* **bootstrap v4** for front-end design
* **haml** for more readable views
* **rspec** for unit and functional testing
* **simplecov** to verify test coverage
* **rubocop** to aid in code style consistency

#### Testing

To run the tests use:
`rspec`
All tests should pass

The coverage report should be in
coverage/index.html
Coverage is 100%



