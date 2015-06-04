# shortly

Another URL shortener. Shortly is a simple, but non-trivial, toy application meant to demonstrate web application construction techniques. Shortly was developed using outside-in, test driven development.

## System dependencies

* Postgresql 9.4.1

## Database Setup

```shell
bin/rake db:create db:migrate
```

## How to run the test suite

* Create the test database
```shell
bin/rake db:create db:migrate RAILS_ENV=test
```
* Run rake
```shell
bin/rake
```

