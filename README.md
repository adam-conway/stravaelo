# Stravaelo
<img src="https://i.imgur.com/EVeLdpu.jpg"/>

Stravaelo is a rails application built using Strava's API which enhances it's competitive nature. With Stravaelo you can create tournaments of popular bike rides, challenge your friends, and see how you're doing compared to the fastest times.

Stravaelo was built using Ruby on Rails and PostgreSQL for data storage. It also makes heavy use of Strava's API for athlete data and OAuth. The front end was built using Bootstrap, including Javascript, CSS3 and HTML.

The production application can be found [here](http://www.stravaelo.com)

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
