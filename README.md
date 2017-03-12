# srink

[![Code Climate](https://lima.codeclimate.com/github/indiebrain/srink/badges/gpa.svg)](https://lima.codeclimate.com/github/indiebrain/srink)

[![Issue Count](https://lima.codeclimate.com/github/indiebrain/srink/badges/issue_count.svg)](https://lima.codeclimate.com/github/indiebrain/srink)

Another URL "shortener". Srink is a simple, but non-trivial, toy application meant to demonstrate web application construction techniques. Srink was developed using outside-in, test driven development. A demo instance of srink is deployed at http://www.srink.us/


## System dependencies

* postgresql


## Application setup
* Get the source
```
git clone http://www.github.com/indiebrain/srink.git
cd srink
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
