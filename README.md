# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Ruby version - 2.4.3


After you've cloned down:

```
bundle
rake db:create
rake db:migrate
```

To add your application.yml for api token storage:
```
bundle exec figaro install
```
