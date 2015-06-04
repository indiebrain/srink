# shortly

Another URL shortener. Shortly is a simple, but non-trivial, toy application meant to demonstrate web application construction techniques. Shortly was developed using outside-in, test driven development.

## System dependencies

* postgresql

## Application setup
* Get the source
```
git clone http://www.github.com/indiebrain/shortly.git
cd shortly
```
* Install Bundled dependencies
```
bundle install
```

## Development Setup
* Create the development database
```
bin/rake db:create db:migrate
```

## How to run the test suite
* Create the test database
```
bin/rake db:create db:migrate RAILS_ENV=test
```
* Run rake
```shell
bin/rake
```

