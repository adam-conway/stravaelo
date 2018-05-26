# README

Ruby version - 2.4.3


After you've cloned down and ran ```bundle``` set up the database:

```
rake db:create
rake db:migrate
```

To add your application.yml for api token storage:
```
bundle exec figaro install
```

Finally, to run the test suite: ```rspec```. The test suite makes use of factory bot for object creation and vcr/webmock for limiting the number of API calls.
