# todo-api

JSON API for todo project built with Roda + Sequel.

## Clone the repository

```sh
git clone https://github.com/paderinandrey/ruby-on-roda.git
cd ruby-on-roda
```

## Check your Ruby version

```sh
ruby -v
```

The ouput should start with something like `ruby 3.1.2`
If not, install the right ruby version.

## Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle install
```

## Setup Database

This project uses PostgreSQL by default, to setup database for development and test environment use following instructions:

1. Create `.env.development` for development environment.
2. Add `DATABASE_URL=postgres:///todo-api-development` and `createdb -h postgres -U postgres todo-api-development` locally.
3. Create `.env.test` for test environment.
4. Add `DATABASE_URL=postgres:///todo-api-test` and `createdb -h postgres -U postgres todo-api-test` locally.

## Migrate database

1. To migrate database in development environment use: `rake db:migrate`
2. To migrate database in test environment use: `RACK_ENV=test rake db:migrate`
3. To migrate database in production environment use: `RACK_ENV=production rake db:migrate`

## Running the app

You can start your application using `rackup` command.

## Generating documentation

You can generate documentation using `rake docs` command.

## Launching tests

You can launch tests using `rspec` command.

## Seed database

To populate data with seeds use `rake db:seed` command.

## Check code style

To check code style using `rubocop` command.
