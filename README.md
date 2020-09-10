# README

This is a project example to demonstrate how the api can be used with ruby on rails framework

Things you may want to know:

* Ruby installed in the version 2.5.5

* Git version with branch control

* Tests with rspec

* PostgreSQL for database

* Staging environment is on Heroku

* Database initialization

How to start the project

* With the project in your environment execute the commands bellow

```
git checkout master
gem install bundler
bundle
rails db:create db:migrate db:seed
```

* With these commands you will with the environment ready to start work

* Now it's time to start the development of issues, bugs and other things

* To do that you need to change to **development** branch and execute

```
git pull origin development
git checkout -b issues/short-description-of-issue
```

* After code the issue run rspec test suite and if it's ok commit

```
bundle exec rspec
git commit -am 'The problem was solved with this...'
git push origin issues/short-description-of-issue
```

* After that you need go to github and ask to merge your branch to **development** branch, if it's ok will merged to **master** branch

* The deploy it's on **heroku** plataform so after get a stable version in master environment run

```
git pull origin master
git push heroku master
```

## Routing system

* The route system for api it's very simple. You will have the endpoints: **products** and **stores**