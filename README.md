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
* Install bundle dependencies
```
bundle install
```


## Development Setup
* Create the development database
```
bin/rake db:create db:migrate
```
* Configure local development environment.
```
cp .env_example .env
```
  * The settings `.env_example` are maintained as the Gold Standard for development. The values provided therein should be enough to get any new developer up and running. Any changes for local development should be placed in the untracked `.env`.
* Start the application
```
foreman start
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

